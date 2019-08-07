class CompaniesController < ApplicationController
  def cpn_page
  end
  
  def new 
    @company = Company.new
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
    @company = Company.find(params[:id])
  end


  private
    def company_params
      params.require(:company).permit(:name, :email, :password,
                                      :password_confirmation,
                                      :location)
    end
end
