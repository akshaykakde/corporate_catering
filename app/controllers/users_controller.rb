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
      p params[:user]

      @user.save
      redirect_to company_users_path
    else
      p params[:user]
      flash[:error]=  @user.errors.messages
      render :new 
    end
  
  end

  def update
    @company = Company.find_by(id: params[:company_id])
    @user = User.find(params[:id])
 
   if @user.update(user_params)

      p params[:change_status]
      if params['change_status']
        render partial: 'user_row', locals: {user: @user}

      else
        redirect_to company_users_path,notice: 'user was deleted!'
      end
       
   else
      flash[:error]= @user.errors.messages
      render :edit
   end
  end

  def edit
    @company = Company.find_by(id: params[:company_id])
    @user = User.find(params[:id])
    
  end

  def index

    @company = Company.find_by(id: params[:company_id])
    @users = @company.users.page(params[:page]).per(5)
    
  end 

  def show
    @company = Company.find_by(id: params[:company_id])
    @user = User.find_by(id: params[:id])

  end

  def search
    
    @search_value = params[:search_value]
    @company = Company.find_by(id: params[:company_id])
    @users = @company.users.where(:name => /#{@search_value}/i).all.page(params[:page]).per(5)
    render :search


  end

  


  private
  def user_params
    params.require(:user).permit(:name,:email,:active,:role,:password,:phone_no)
  end




end
