# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :shop

  has_many :order_items, dependent: :destroy

  validates :total_price, presence: true
  validates :payment, presence: true
  validates :delivery_on, presence: true
  validates :delivery_status, presence: true

  enum delivery_status: %w[
    受注確認前
    発送準備中
    配送中
    納品済み
  ]

  enum payment: %w[
    クレジットカード
    銀行振込
  ]
end
