require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Associations' do
    it { should have_many(:appointments).dependent(:destroy) }
    it { should have_many(:users) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
