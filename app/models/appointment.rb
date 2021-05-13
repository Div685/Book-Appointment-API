class Appointment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates_presence_of :date

  default_scope { order('created_at DESC') }
  default_scope { includes(:user, :item) }

end
