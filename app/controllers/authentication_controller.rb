class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      render json: { tokens: {
                       auth_token: command.result,
                       refresh_token: refresh_token
                      }
                    }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def refresh
    command = RefreshUser.call(params[:refresh_token], device)
    if command.success?
      render json: { tokens: {
                       auth_token: command.result[:auth],
                       refresh_token: command.result[:refresh]
                      }
                    }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

    def refresh_token
      GenerateRefreshToken.call(params[:email], device).result
    end

    def device
      request.user_agent.to_s.delete(' ')
    end
end
