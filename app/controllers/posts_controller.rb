class PostsController < ApplicationController
  def index
    @posts = Post.order(:id)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿されました！"
      redirect_to post_path(@post)
    else
      render 'posts/new'
    end
  end


  private

  def post_params
    params.require(:post).permit(:genre, :content)
  end
end
