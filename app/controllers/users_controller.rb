class UsersController < ApplicationController
  # before_action :authenticate_user!

  # if @current_user == "dummy"
  #   redirect_to @companies_path
  # end

  def new
    @company = Company.find_by(id: params[:company_id])
    @user = @company.users.build
  end

  def create
    @company = Company.find_by(id: params[:company_id])
    @user = @company.users.create(user_params)
    if @user.valid?
      p "valid hai!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      p params[:user]

      @user.save
      redirect_to company_users_path
    else
      p "valid nahi hai!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      p params[:user]
      flash[:error]=  @user.errors.messages
      render :new 
    end
  
  end

  def update
    @company = Company.find_by(id: params[:company_id])
    @user = User.find(params[:id])
 
   if @user.update(user_params)
      redirect_to company_users_path
   else
      flash[:error]= @user.errors.messages
      render :edit
   end
  end

  def edit
    @company = Company.find_by(id: params[:company_id])
    @user = User.find(params[:id])
    
  end

  # def destroy
  #   @user = user.find(params[:id])
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to companies_url,notice: 'user was deleted!'}
  #     format.json {  redirect_to companies_path,notice: 'user was deleted!'}
  #     format.js   {  redirect_to companies_path,notice: 'user was deleted!'}
  #  end
    # format.html{redirect_to companies_path,notice: 'user was deleted!'}
    # format.json{render json: @user,status: :deleted,location: @user}
  #   userMailer.account_deletion(@user).deliver_now    
  #   redirect_to companies_path
  # end




  def index
=begin    @company = Company.where(params[:company_id])

    # @user = {}
    @users = User.find_by(params[:company_id]).first
=end
    @company = Company.find_by(id: params[:company_id])
    @users = @company.users
    p @user, "1111"
  end 

  def show
    p @users, "222"
    @company = Company.find_by(id: params[:company_id])
    @user = User.find_by(id: params[:id])

  end

  


  private
  def user_params
    params.require(:user).permit(:name,:email,:active,:role,:password,:phone_no)
  end




end
