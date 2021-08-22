class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :shop_image

  enum shop_genre: [
    "食肉",
    "水産",
    "野菜・青果",
    "その他"
  ]

end
