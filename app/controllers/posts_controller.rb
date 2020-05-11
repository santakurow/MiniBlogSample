class PostsController < ApplicationController
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
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
