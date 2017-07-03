class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		@user = current_user
	end

	def create
		@tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:success] = "貼文已發佈"
      redirect_to root_path
    else
      flash[:error] = "基於某些原因貼文尚未發布，請稍後再試"
      redirect_to new_tweet_path
    end
	end

	private
	def tweet_params
    params.require(:tweet).permit(:user_id, :body)
  end
end
