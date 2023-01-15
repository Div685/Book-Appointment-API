require 'rails_helper'

RSpec.describe 'UserCoupons', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/user_coupons/index'
      expect(response).to have_http_status(:success)
    end
  end
end
