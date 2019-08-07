class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :destroy, :edit, :update]
  before_action :logged_in_user, only: [:show, :destroy, :edit, :update]

  def cpn_page
  end
  
  def new 
    @company = Company.new
  end

  def edit
    @in_proccess_works = 
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
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def show
  end


  private
    def company_params
      params.require(:company).permit(:name, :email, :password,
                                      :password_confirmation,
                                      :location)
    end

    def find_company
      @company = Company.find_by id: params[:id]
    end
end
