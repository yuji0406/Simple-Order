# frozen_string_literal: true

class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :shop_image

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
