class CommentsController < ApplicationController

  respond_to :json, :html

	def update_comment
    response = Comment.update_comment(params)

    respond_with response
	end

  def comment_params
    params.require(:comment).permit(:user_id, :text, :approved, :rating)
  end

  private :comment_params
end
