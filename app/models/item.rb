class Item < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  has_many :item_coupons
  has_many :coupons, through: :item_coupons

  validates_presence_of :name

  scope :order_by_name, -> { order(name: :asc) }
end
