class Shops::ItemsController < ApplicationController
  before_action :set_item,only:[:show,:edit,:update]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to shops_item_path(item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to shops_item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :item_name,
      :item_genre,
      :item_image,
      :item_introduction,
      :item_price,
      :sale_status
      )
  end
end
