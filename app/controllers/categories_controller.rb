class CategoriesController < ApplicationController
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to user_path
    else
      render "new"
    end
  end
  
  def index
    @categories = User.find(session[:user_id]).categories
  end
  
  def edit
    @category = Category.find(params[:id])
    @user = User.find(session[:user_id])
  end
  
  def update
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to user_path
    else
      render "edit"
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to user_path
  end
  
  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end
  
  
  
  private
  
  def category_params
    params[:category].permit(:name, :user_id)
  end
end
