class PostsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.with_rich_text_body_and_embeds
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_params
    @post = Post.find(params[:id])
  end
end
