class Public::ItemsController < PublicController
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    if params[:item_genre] && params[:shop_id]
      @items = Item.where(item_genre: params[:item_genre], shop_id: params[:shop_id]).order(created_at: 'DESC')
    elsif params[:item_genre]
      @items = Item.where(item_genre: params[:item_genre]).order(created_at: 'DESC')
    elsif params[:shop_id]
      @items = Item.where(shop_id: params[:shop_id]).order(created_at: 'DESC')
    else
      @items = Item.all.order(created_at: 'DESC')
    end
  end

  def search
    if params[:keyward].present?
      @items = Item.where('item_name LIKE ? OR item_introduction LIKE ?', "%#{params[:keyward]}%", "%#{params[:keyward]}%").order(created_at: 'DESC')
    else
      @items = Item.none
    end
  end
end
