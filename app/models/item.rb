class Item < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates_presence_of :name

  scope :order_by_name, -> { order(name: :asc) }
end
