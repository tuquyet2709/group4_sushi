class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :destroy, :edit, :update, :works]
  before_action :logged_in_user, only: [:show, :destroy, :edit, :update]

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
      log_in @student
    else
      render :new
    end
  end

  def show
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def works
    @works = Work.all
    @work_inprocesses = Work.find_by_sql([
        "select * from works where id IN (
         select work_id from student_work_statuses where student_id = ? and process_status = 1
         )", @student.id])
    @work_done = Work.find_by_sql([
         "select * from works where id IN (
         select work_id from student_work_statuses where student_id = ? and process_status = 2
         )", @student.id])
    @work_wait = Work.find_by_sql([
         "select * from works where id IN (
         select work_id from student_work_statuses where student_id = ? and process_status = 0
         )", @student.id])
    @work_refuse = Work.find_by_sql([
         "select * from works where id IN (
         select work_id from student_work_statuses where student_id = ? and process_status = 3
         )", @student.id])
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
