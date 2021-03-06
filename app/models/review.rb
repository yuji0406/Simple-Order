# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :shop

  validates :rate, presence: true
end
