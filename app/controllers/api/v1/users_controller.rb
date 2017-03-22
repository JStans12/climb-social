class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: "shit"
    end
  end

  private

    def user_params
      JSON.parse(params[:user], symbolize_names: true)
    end
end
