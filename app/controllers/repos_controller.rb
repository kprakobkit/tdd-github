class ReposController < ApplicationController
  def create
    @repo = Util.post_repo(params[:repo])
    respond_to do |format|
      format.html { redirect_to "/users/#{repo["owner"]["login"]}"}
      format.js {}
    end
  end
end
