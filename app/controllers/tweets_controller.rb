class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
		@user = current_user
	end

	def create
		@tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:success] = "成功註冊新使用者"
      redirect_to root_path
    else
      flash[:error] = "資料不完整或有誤"
      redirect_to new_tweet_path
    end
	end

	private
	def tweet_params
    params.require(:tweet).permit(:user_id, :body)
  end
end
