class UsersController < ApplicationController
  def show
    @user = User.find(params[:username])
    @repos = @user.repos
  end
end
