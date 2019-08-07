class StudentWorkStatusesController < ApplicationController
  before_action :logged_in_student , only: [:apply]

  def apply
    @new_job = StudentWorkStatus.new
    @new_job.work_id = params[:my_service][:work_id]
    @new_job.student_id = params[:my_service][:student_id]
    @new_job.process_status = 0
    @new_job.save

    redirect_to work_path(id: @new_job.work_id)
  end
end
