class Item < ApplicationRecord
  
  belongs_to :shop
  
  has_many :cart_items
  has_many :order_items

  attachment :item_image

  enum item_genre:[
    "食肉",
    "食肉加工品",
    "魚介",
    "魚介加工品",
    "青果",
    "野菜",
    "調味料",
    "その他"
    ]
end
