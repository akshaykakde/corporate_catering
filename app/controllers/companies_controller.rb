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

  def company
    @destroy = Company.find(params[:id])
    @company.destroy
    p "=============RECORD IS DESTROYED====================="
   #  respond_to do |format|
   #    format.html { redirect_to companies_url,notice: 'Company was deleted!'}
   #    format.json {  redirect_to companies_path,notice: 'Company was deleted!'}
   #    format.js   {  redirect_to companies_path,notice: 'Company was deleted!'}
   # end
    # format.html{redirect_to companies_path,notice: 'Company was deleted!'}
    # format.json{render json: @company,status: :deleted,location: @company}
    # CompanyMailer.account_deletion(@company).deliver_now    
    redirect_to companies_path
  end

  def index
    @company = Company.all
    respond_to do |format|
      @company = @company.page(params[:page])
      format.html # index.html.erb
      format.json { render json: @company }
    end
  end 

  def show
    @company = Company.find(params[:id])
    #redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name,:email,:phone_no)
  end

end
