# frozen_string_literal: true

class Item < ApplicationRecord
  attachment :item_image

  def tax
    1.1
  end

  def tax_price
    (item_price * tax).floor
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
