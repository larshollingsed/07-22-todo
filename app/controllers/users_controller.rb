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
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    if params[:user][:password] != "" && BCrypt::Password.new(@user.password) != params[:user][:password]
      @user.encrypt_password(params[:user][:password])
      params[:user][:password] = @user.password
      if @user.update_attributes(user_params_and_password)
        redirect_to user_path
      else
        render "edit"
      end
    else
      if @user.update_attributes(user_params)
        redirect_to user_path
      else
        render "edit"
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end
  
  def show
    @user = User.find(session[:user_id])
    @items = @user.items
  end
  
  def login
  end
  
  def login_confirm
    @user = User.find_by(email: params[:user][:email])
    if @user.correct_password?(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path
    else
      render "login"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to users_path
  end
  
  private
  
  def user_params
    params[:user].permit(:name, :email)
  end
  def user_params_and_password
    params[:user].permit(:name, :email, :password)
  end
  
end
