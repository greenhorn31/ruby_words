class ApplicationController < ActionController::API
  Mongoid.load! './config/mongoid.yml'

  attr_reader :current_user

  def current_user_init
    @current_user = User.find(params[:id => '5981d5479e93f91208070615'])
  end
end
