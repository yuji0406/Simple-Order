# frozen_string_literal: true

class Item < ApplicationRecord
  attachment :item_image

  def tax
    1.1
  end

  def tax_price
    (item_price * tax).floor
  end

  def self.search(keyward)
    if keyward
      Item.where('item_name LIKE ? OR item_introduction LIKE ?', "%#{keyward}%",
                  "%#{keyward}%")
    else
       Item.none
    end
  end

  def self.select(item_genre, shop_id)
    if item_genre && shop_id
       Item.where(item_genre: item_genre, shop_id: shop_id)
    elsif item_genre
       Item.where(item_genre: item_genre)
    elsif shop_id
       Item.where(shop_id: shop_id)
    else
       Item.all
    end
  end

  belongs_to :shop

  has_many :cart_items
  has_many :order_items

  validates :item_name, presence: true
  validates :item_price, presence: true
  validates :item_genre, presence: true
  validates :item_introduction, presence: true

  enum item_genre: %w[
    食肉
    食肉加工品
    魚介
    魚介加工品
    青果
    野菜
    調味料
    その他
  ]
end
