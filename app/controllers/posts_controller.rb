class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.order("created_at desc")
    respond_with @posts
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end 
end
