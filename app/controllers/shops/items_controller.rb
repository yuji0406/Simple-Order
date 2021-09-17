class Shops::ItemsController < ShopsController
  before_action :set_item,only:[:show,:edit,:update]

  def index
    if params[:genre]
      @items = Item.where(item_genre: params[:genre], shop_id: current_shop.id)
    else
      @items = Item.where(shop_id: current_shop.id)
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.shop_id = current_shop.id
    if @item.save
      redirect_to shops_item_path(@item.id)
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
      redirect_to shops_item_path(@item.id)
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
