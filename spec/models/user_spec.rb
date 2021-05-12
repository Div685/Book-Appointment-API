require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:appointments).dependent(:destroy) }
    it { should have_many(:items) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:username) }
  end
end
