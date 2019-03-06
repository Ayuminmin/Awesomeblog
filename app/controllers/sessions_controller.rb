class SessionsController < ApplicationController
  def new
  end
  def create
    #select * form users where email=para,s[:session][:email]
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:success] = "Successfully logged In."
      redirect_to root_url
    else
      flash[:danger] = "Invalid Credentials."
      render 'new'
    end
  end
  def destroy
    logout
    flash[:info] = "Successfully logged out"
    redirect_to root_url
  end
end
