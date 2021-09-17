class Message < ApplicationRecord
  belongs_to :room
  
  validates :content, presence: true
  validates :is_customer, presence: true
end
