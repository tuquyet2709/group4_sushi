class SessionController < ApplicationController
  def new
  end

  def create
    company = Company.find_by(email: params[:session][:email].downcase)
    if company.nil?
      student = Student.find_by(email: params[:session][:email].downcase)
    end

    if company && company.authenticate(params[:session][:password])
      log_in_company company
      redirect_to root_path
    elsif student && student.authenticate(params[:session][:password])
      log_in_student student
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email or password!"
      render :new
    end
  end

  def destroy
    log_out_student if logged_in_student?
    log_out_company if logged_in_company?
    redirect_to root_url
  end


end
