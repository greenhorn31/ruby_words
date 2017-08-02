class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    end

  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

 private

  def user_params
    params.require(:user).permit(
        :name,
        :email,
        :password
    )
  end

end
