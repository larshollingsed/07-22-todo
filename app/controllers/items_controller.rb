class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render "new"
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to items_path
    else
      render "edit"
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params[:item].permit(:name, :content, :user_id)
  end
  
end
