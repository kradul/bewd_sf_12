class CommentsController < ApplicationController
  def create
      safe_comment = params.require(:comment).permit(:post).merge(story_id: params[:story_id])
      @comment = Comment.create(safe_comment)
      redirect_to @comment.story
  end
end

