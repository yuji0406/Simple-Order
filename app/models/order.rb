class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_items, dependent: :destroy

  enum delivery_status:[
    "受注確認前",
    "発送準備中",
    "配送中",
    "納品済み"
    ]

    enum payment:[
      "クレジットカード",
      "銀行振込"
      ]
end
