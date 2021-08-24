class Item < ApplicationRecord

  attachment :item_image

  enum item_genre:[
    "食肉",
    "食肉加工品",
    "魚介",
    "魚介加工品",
    "調味料",
    "その他"
    ]
end
