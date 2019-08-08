class WorksController < ApplicationController
  before_action :set_search

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash.now[:success] = "Create Work successed!"
      redirect_to @work
    else
      render 'new'
    end
  end

  def index
    if params[:q].present?
      @q = Work.search(params[:q])
      @works = @q.result(distinct: true).page(params[:page]).per 7
    else
      @works = Work.all.page(params[:page]).per 7
    end
  end

  def show
    @work = Work.find(params[:id])
    @date_count = (@work.dateline.to_date - DateTime.now.to_date).to_i
    if logged_in_student? == false
      @hasJob = 2;
    else
      @joblist = StudentWorkStatus.find_by_sql(["select * from student_work_statuses where work_id = ? and student_id = ?", @work.id, current_student.id]);
      if (@joblist.length == 0)
        @hasJob = 0;
      else
        @hasjob = 1;
        @job = @joblist.first
      end
    end


  end

  private

  def work_params
    params.require(:work).permit(:title, :company_id, :dateline,
                                 :salary,
                                 :tag,
                                 :work_location,
                                 :content,
                                 :status,
                                 :process_status
    )
  end
end
