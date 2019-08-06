class SessionController < ApplicationController
  def new
  end

  def create
    user = Company.find_by(email: params[:session][:email].downcase)
    if user.nil?
      user = Student.find_by(email: params[:session][:email].downcase) 
    end

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email or password!"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end


end
