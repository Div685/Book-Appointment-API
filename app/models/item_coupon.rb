class ItemCoupon < ApplicationRecord
  belongs_to :item
  belongs_to :coupon
end
