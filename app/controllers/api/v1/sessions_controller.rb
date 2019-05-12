class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render 'hi'
    else
      render 'go away'
    end
  end
  def destroy
    session[:user_id] = nil
    render 'ok'
  end
end
