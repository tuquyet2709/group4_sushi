class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :destroy, :edit, :update]
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


  private
    def company_params
      params.require(:company).permit(:name, :email, :password,
                                      :password_confirmation,
                                      :location, :phone)
    end

    def find_company
      @company = Company.find_by id: params[:id]
    end
end
