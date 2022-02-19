class TweetsController < ApplicationController
	def create
	    @tweet = Tweet.new
		@tweet.tweet = params[:tweet][:tweet]
		@tweet.action_name = params[:tweet][:action_name]
    	@tweet.user_id = current_user.id
		if @tweet.save
		    flash[:notice] = 'コメントを投稿しました！'
		    redirect_back(fallback_location: root_path)
		else
		    redirect_to :rollback, flash: {
		    tweet: @tweet,
		    error_messages: @tweet.errors.full_messages
		    }
	    end
	end

    private
    def tweet_params
      params.require(:tweet).permit(:tweet)
    end

end
