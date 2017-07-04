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
    @user = User.find(params[:id])
    # render edit_user_path
  end

  def edit
    if current_user.id.to_s == params[:id]
      @user = current_user
    else
      redirect_to user_path
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      flash[:error] = "暫時無法完成上傳"
      redirect_to user_path
    end
  end

  def find
    @q = params[:query]
    @user = User.where("username LIKE ? or email LIKE ?", @q, @q)
    # @user = User.find_by(username: params[:query])
    if @user.present?
      redirect_to user_path(@user.first.id)
      # using where method returns an array of model
    else
      flash[:error] = "找不到使用者"
      # redirect_to user_path(current_user.id)
      redirect_to request.referer
    end
  end

  def followers
    p params
    p "==========="
    @user = User.find(params[:id])
    p @user
    @followees = @user.followees
    @followers = @user.followers
  end

  def followees
  	
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :avatar, :itf, :utr, :ntr, :righthanded, :double_handed_backhand, :height, :weight, :sat, :toefl, :act, :birthday, :about)
  end

end
