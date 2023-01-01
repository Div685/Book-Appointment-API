class UserCoupon < ApplicationRecord
  belongs_to :user
  belongs_to :coupon

  default_scope { includes(:user) }
end
