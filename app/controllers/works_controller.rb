class WorksController < ApplicationController
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


  def show
    @work = Work.find(params[:id])
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
