# frozen_string_literal: true

class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :shop_image
  
  def self.search(keyward)
    if keyward
      Shop.where('shop_name LIKE ? OR introduction LIKE ?', "%#{keyward}%",
                  "%#{keyward}%")
    else
      Shop.none
    end
  end
  
  def self.select(shop_genre)
    if shop_genre
      Shop.where(shop_genre: shop_genre)
    else
      Shop.all
    end
  end

  has_many :items, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :shop_name, presence: true
  validates :manager, presence: true
  validates :shop_genre, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true
  enum shop_genre: [
    '食肉',
    '水産',
    '野菜・青果',
    'その他'
  ]
end
