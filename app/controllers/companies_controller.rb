class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :destroy, :edit, :update, :works]
  before_action :logged_in_company, only: [:show, :destroy, :edit, :update]

  def cpn_page
  end
  
  def new 
    @company = Company.new
  end

  def edit
  end

  def update
    if @company.update_attributes company_params
      flash[:success] = "アプデートしました！"
      redirect_to @company
    else
      render :edit
    end
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash.now[:success] = "Signup successed!"
      redirect_to root_path
      log_in_company @company
    else
      render :new
    end
  end
  
  def show
  end

  def works
    @work_inprocesses_open = Work.where(["company_id = ? and process_status = ? and status = ?", @company.id, false, true])
    @work_inprocesses_close = Work.where(["company_id = ? and process_status = ? and status = ?", @company.id, false, false])
    @work_done = Work.where(["company_id = ? and process_status = ?", @company.id, true])
  end

  private
    def company_params
      params.require(:company).permit(:name, :email, :password,
                                      :password_confirmation, :pr_content,
                                      :address, :phone)
    end

    def find_company
      @company = Company.find_by id: params[:id]
    end
end
