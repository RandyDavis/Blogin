class CommentsController < ApplicationController
  before_filter do
    @post = Post.find(params[:post_id])
  end

  def create
    
    @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
