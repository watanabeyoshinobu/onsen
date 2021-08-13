class CommentsController < ApplicationController

	def create
	    @comment = Comment.new(comment_params)
    	@comment.user_id = current_user.id
		if @comment.save
		    flash[:notice] = 'コメントを投稿しました！'
		    redirect_back(fallback_location: 'blog[:id]')
		else
		    redirect_to :rollback, flash: {
		    comment: @comment,
		    error_messages: @comment.errors.full_messages
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
		params.require(:comment).permit(:comment, :reply_comment, :blog_id)
	end

end
