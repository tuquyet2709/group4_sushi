class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper

  private

  def logged_in_user
    return if logged_in?
    flash[:danger] = "ログインをお願いします！"
    redirect_to login_path
  end
end
