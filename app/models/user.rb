class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  has_many :items, through: :appointments

  has_many :user_coupons
  has_many :coupons, through: :user_coupons


  validates :username, presence: true, uniqueness: true
end
