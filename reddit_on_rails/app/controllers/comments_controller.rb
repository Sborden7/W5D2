class CommentsController < ApplicationController
  before_action :require_logged_in!

  def create
    @comment = Comment.new(comment_params)
    # @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id

    @comment.save
    flash[:errors] = @comment.errors.full_messages
    redirect_to post_url(@comment.post)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_url(comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
