class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username params[:username]
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged In!"
    else
      flash[:error] = "Wrong username or password."
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out!"
  end
end
