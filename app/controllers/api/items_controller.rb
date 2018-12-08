class Api::ItemsController < ApplicationController
before_action :set_item, only: [:destroy]
before_action :set_menu, only: [:index, :create]

  def index
    render json: @menu.items.all
  end

  def create
    item = @menu.items.new(item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end 


  def destroy
    Item.find(params[:id]).destroy
    render json: {message: "Item Deleted"}
  end

  private
  def item_params
    params.require(:item).permit(:name, :price)
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
