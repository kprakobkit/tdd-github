class UsersController < ApplicationController
  def show
    @user = User.find(params[:username])
    @current_user = User.current
    @repos = @user.repos
  end
end
