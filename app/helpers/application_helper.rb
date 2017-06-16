module ApplicationHelper
  def login
    user = User.find_by(username: params[:session][:username])
    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.admin
        redirect_to '/admin'
      else
        redirect_to root_path
      end
    else
      flash[:fail] = "Username or password incorrect."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
