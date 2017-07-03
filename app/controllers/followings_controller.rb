class FollowingsController < ApplicationController
	def create
		@following = Following.new(following_params)

		if @following.save
      flash[:success] = "成功註冊新使用者"
      redirect_to root_path
    else
      flash[:error] = "資料不完整或有誤"
      redirect_to request.referrer
    end
	end

	def destroy
  	@following = Following.find_by(follower_id: params[:follower], followee_id: params[:followee])
  	p @following
  	p params
  	p "==========="
  	@following.destroy
  	redirect_to root_path
	end

	private
	def following_params
	params.require(:following).permit(:follower_id, :followee_id)
	end
end
