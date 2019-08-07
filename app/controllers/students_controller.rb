class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :destroy, :edit, :update]
  before_action :logged_in_user, only: [:show, :destroy, :edit, :update]

  def std_page
  end

  def new
    @student = Student.new
  end

  def edit

  end

  def update
    if @student.update_attributes student_params
      flash[:success] = "アプデートしました！"
      redirect_to @student
    else
      render :edit
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash.now[:success] = "Signup successed!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation,
                                    :age, :phone, :school, :program_language, :pr_content)
  end

  def find_student
    @student = Student.find_by id: params[:id]
  end
end
