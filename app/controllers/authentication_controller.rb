class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      refresh_token = GenerateRefreshToken.call(params[:email], device).result
      render json: { tokens: {
                       auth_token: command.result,
                       refresh_token: refresh_token
                      }
                    }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def device
    request.user_agent.to_s.delete(' ')
  end
end
