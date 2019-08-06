module SessionHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_student
        if session[:user_id]
          @current_user ||= Student.find_by(id: session[:user_id])
        end
      end

    def logged_in?
        current_student.present?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
      end
end
