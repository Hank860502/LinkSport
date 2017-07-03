class FollowingsController < ApplicationController
	def new 
    @following = Following.new
	end
	def create
		@following = Following.new(following_params)

		if @following.save
      # flash[:success] = "已成功追蹤此使用者"
      redirect_to root_path
    else
      # flash[:error] = "無法完成追蹤要求"
      redirect_to request.referrer
    end
	end

	def destroy
  	@following = Following.find_by(follower_id: params[:follower], followee_id: params[:followee])
  	@following.destroy
  	redirect_to request.referrer
	end

	private
	def following_params
	params.require(:following).permit(:follower_id, :followee_id)
	end
end
