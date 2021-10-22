class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @posts = @user.posts.availables
  end

  def feed
    @posts = current_user.feed
  end
end
