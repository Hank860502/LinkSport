class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "New user added!"
      redirect_to root_path
    else
      flash[:error] = "Invalid Input!"
      redirect_to new_user_path
    end
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
