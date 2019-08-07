module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      if Student.find_by(id: session[:user_id])
        @current_user ||= Student.find_by(id: session[:user_id])
      else
        @current_user ||= Company.find_by(id: session[:user_id])
      end
    end
  end

  def logged_in?
    current_user.present?
  end
  #
  # def is_student?
  #   current_user == "Student"? 1 : 0
  # end
  #
  # def is_company?
  #   current_user == "Company"? 1 : 0
  # end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
