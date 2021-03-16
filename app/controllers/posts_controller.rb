class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:edit, :update]

  def index
    #@posts = Post.order(:id)
    @posts = Post.paginate(page: params[:page])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "更新されました！"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.admin? || current_user?(@post.user)
      @post.destroy
      flash[:success] = "投稿が削除されました"
      redirect_to request.referrer == user_url(@post.user) ? user_url(@post.user) : root_url
    else
      flash[:danger] = "他人の投稿は削除できません"
      redirect_to root_url
    end
  end


  private

  def post_params
    params.require(:post).permit(:genre, :content)
  end

  def correct_user
      # 現在のユーザーが更新対象の投稿を保有しているかどうか確認
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end