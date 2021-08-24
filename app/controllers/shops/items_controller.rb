class Shops::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
    redirect_to item
    else
    render new
    end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(
      :item_name,
      :item_genre,
      :item_image_id,
      :item_introduction,
      :item_price,
      :sale_status
      )
  end
end
