class ItemsController < ApplicationController
  before_action :check_login
  def index
    @categories = @user.categories
    @items = @user.items
  end
  
  def new
    @categories = @user.categories
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      @user.items << @item
      redirect_to user_path
    else
      render "new"
    end
  end
  
  def edit
    @item = Item.find(params[:id])
    @categories = User.find(session[:user_id]).categories
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to user_path
    else
      render "edit"
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params[:item].permit(:name, :content, :user_id, :category_id)
  end
  
end
