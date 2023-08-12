class Coupon < ApplicationRecord
  has_many :item_coupons
  has_many :items, through: :item_coupons

  has_many :user_coupons
  has_many :users, through: :user_coupons
end
