class UsersController < ApplicationController

  skip_before_action :authorize_request, only: [:create,:index]

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    render json: [auth_token: auth_token]

  end

  def index
    @users = User.all
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation
    )
  end
end
