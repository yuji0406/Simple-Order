# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :shop
end
