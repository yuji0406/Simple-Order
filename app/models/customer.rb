# frozen_string_literal: true

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :store_name, presence: true
  validates :store_manager, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true
end
