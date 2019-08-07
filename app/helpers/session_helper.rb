module SessionHelper
  # def log_in(user)
  #   session[:user_id] = user.id
  # end
  #
  # def current_user
  #   if session[:user_id]
  #     if Student.find_by(id: session[:user_id])
  #       @current_user ||= Student.find_by(id: session[:user_id])
  #     else
  #       @current_user ||= Company.find_by(id: session[:user_id])
  #     end
  #   end
  # end

  def log_in_student(student)
    session[:student_id] = student.id
  end

  def log_in_company(company)
    session[:company_id] = company.id
  end

  def current_student
    if session[:student_id]
      @current_student ||= Student.find_by(id: session[:student_id])
    end
  end

  def current_company
    if session[:company_id]
      @current_company ||= Company.find_by(id: session[:company_id])
    end
  end

  def logged_in_student?
    current_student.present?
  end

  def logged_in_company?
    current_company.present?
  end

  def log_out_student
    session.delete(:student_id)
    @current_student = nil
  end

  def log_out_company
    session.delete(:company_id)
    @current_company = nil
  end
end
