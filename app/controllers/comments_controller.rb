class CommentsController < ApplicationController
  def create
    meme = find_meme
    @comment = meme.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to meme_path(meme)
    else
      flash[:alert] = "Could not create comment"
    end
  end

  private

  def find_meme
    Meme.find(params[:meme_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
