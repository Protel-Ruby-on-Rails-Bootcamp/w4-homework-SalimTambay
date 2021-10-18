class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
 
  def index
    @posts = Post.all
    @user = User.all
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end
  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :update
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit(:title, :content, :visible,:user_id).merge(user_id: current_user.id)
  end
end