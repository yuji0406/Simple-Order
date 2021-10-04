# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  belongs_to :shop

  validates :amount, presence: true
end
