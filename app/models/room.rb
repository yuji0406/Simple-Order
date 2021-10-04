# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :customer
  belongs_to :shop

  has_many :messages, dependent: :destroy
end
