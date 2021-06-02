class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  has_many :items, through: :appointments

  validates :username, presence: true, uniqueness: true
end
