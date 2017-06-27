class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "成功註冊新使用者"
      redirect_to root_path
    else
      flash[:error] = "資料不完整或有誤"
      redirect_to new_user_path
    end
  end

  def show

  end

  def find
    @user = User.find_by(username: params[:username])
    
  end

  def followers
  end

  def followees
  	
  end

  # def show
  #   unless current_user.id == params[:id].to_i
  #     flash[:error] = 'You are not that user!'
  #     redirect_to root_path
  #   end
  #   @user = User.find(params[:id])
  #   end
  # end

  # private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
