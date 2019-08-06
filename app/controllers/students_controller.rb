class StudentsController < ApplicationController
  def std_page
  end

  def new
    @student = Student.new
  end


  def create
    @student = Student.new(student_params)
    if @student.save
      flash.now[:success] = "Signup successed!"
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    log_out
    redirect_to root_path

  end


  private
    def student_params
      params.require(:student).permit(:name, :email, :password,
                                      :password_confirmation,
                                      :age,
                                      :school,
                                      :program_language)
    end
end
