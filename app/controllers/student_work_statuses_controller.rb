class StudentWorkStatusesController < ApplicationController
  before_action :logged_in_student, only: [:apply]

  def apply
    @new_job = StudentWorkStatus.new
    @new_job.work_id = params[:my_service][:work_id]
    @new_job.student_id = params[:my_service][:student_id]
    @new_job.process_status = 0
    @new_job.save

    redirect_to work_path(id: @new_job.work_id)
  end

  def update

    @id_work = params[:my_service][:work_id]
    @student_id = params[:my_service][:student_id]
    @work_status_id = params[:my_service][:work_status_id]
    @student = Student.find(@student_id)
    @work = Work.find(@id_work)
    render 'update'
    # redirect_to work_path(id: @id_work)
  end

  def reply_request
    @work_status_id = params[:my_service][:work_status_id]
    @new_job = StudentWorkStatus.find(@work_status_id)
    @new_job.work_id = params[:my_service][:work_id]
    @new_job.student_id = params[:my_service][:student_id]
    @new_job.process_status = params[:my_service][:process_status]
    @new_job.save
    redirect_to work_path(id: @new_job.work_id)
  end

end
