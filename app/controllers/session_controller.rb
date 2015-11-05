class SessionController < ApplicationController
  def create
  user = User.find_by(email: user_params[:email])

  if user && user.authenticate(user_params[:password])
    session[:current_user_id] = user.id
    flash[:message] = "Thanks for loggin in " + user.name
  else
    flash[:message] = "Username or Password combo are not correct"
  end
  redirect_to root_path
  end
  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
  private
  # Probably don't need name as one of the params here since its only for the session
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
