class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
  end
  
  def create
    @user = User.new(user_params_and_password)
    @user.encrypt_password(params[:user][:password])
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if params[:user][:password] != "" && BCrypt::Password.new(@user.password) != params[:user][:password]
      @user.encrypt_password(params[:user][:password])
      params[:user][:password] = @user.password
      if @user.update_attributes(user_params_and_password)
        binding.pry
        redirect_to users_path
      else
        render "edit"
      end
    else
      if @user.update_attributes(user_params)
        binding.pry
        redirect_to users_path
      else
        render "edit"
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params[:user].permit(:name, :email)
  end
  def user_params_and_password
    params[:user].permit(:name, :email, :password)
  end
  
end
