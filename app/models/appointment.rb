class Appointment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates_presence_of :date
end
