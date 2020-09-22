class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @user = current_user
    if @user.admin
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
  end

  private

    def post_params
      params.require(:post).permit(:user_id, :title, :url, :category)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
