class UsersController < ApplicationController
  def show
    @user = User.find(params[:username])
    @repo = @user.repos
  end
end
