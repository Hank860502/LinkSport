class SessionsController < ApplicationController
  include ApplicationHelper

  def new
  end

  def create
    login
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
end
end
