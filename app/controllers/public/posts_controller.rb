class Public::PostsController < ApplicationController
  #ユーザーのログイン状態を確かめる。
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path, alert: I18n.t('post.no_image')
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :posted_text, :image)
  end
end
