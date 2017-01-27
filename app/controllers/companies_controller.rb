class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      @company.save
      redirect_to companies_path
    else
      flash[:error] = @company.errors.messages
      render :new 
    end
  
  end

  def update
    @company = Company.find(params[:id])
 
   if @company.update(company_params)
      redirect_to companies_path
   else
      flash[:error] = @company.errors.messages
      render :edit
   end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
    respond_to do |format|
      @companies = @companies.page(1).per(5)
      format.html
      format.json { render json: @companies }
    end
  end 

  def show
    @company = Company.find(params[:id])
  end

  private
  def company_params
    params.require(:company).permit(:name,:email,:phone_no)
  end

end
