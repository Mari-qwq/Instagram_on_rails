class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post
    else
      redirect_to @post, alert: "Comment cannot be empty."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
    end

    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
