class CommentsController < ApplicationController

	def create
	    comment = Comment.new(comment_params)
    		@comment.user_id = current_user.id
	    if comment.save
	        flash[:notice] = 'コメントを投稿しました！'
	        redirect_to '/blogs'
	    else
	        redirect_to :back, flash: {
	            comment: comment,
	            error_messages: comment.errors.full_messages
	        }
      	end
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.delete
		redirect_to comment.blog, flash: { notice: 'コメントが削除されました' }
	end

	private

	def comment_params
		params.require(:comment).permit(:comment).merge(user_id: current_user.id)
	end

end
