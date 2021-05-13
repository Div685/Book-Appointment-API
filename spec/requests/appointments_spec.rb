require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  
  # initialize test data
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
  let!(:appointments) { create_list(:appointment, 10, user_id: user.id, item_id: item.id) }
  let(:item_id) { item.id }
  let(:appointment_id) { appointments.first.id }

  let(:auth_params) { { username: user.username, password: user.password } }

  let(:params_value) do
    {
      user: {
        username: user.username,
        password: user.password
      }
    }
  end

  def authenticated_header(user)
    post '/api/v1/login', params: params_value
    token = json['token']
    { 'Authorization': "Bearer #{token}" }
  end

  describe "GET /api/v1/appointments" do
    before { get '/api/v1/appointments', headers: authenticated_header(user) }

    it 'returns appointments size to be 10' do
      expect(json.size).to eq(10)
    end
    
    it 'returns appointment not be empty' do
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/appointment/:id' do
    context 'when request is valid' do
      before { get "/api/v1/appointments/#{appointment_id}", headers: authenticated_header(user) }

      it 'returns status symbol :ok' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when request is invalid' do
      let(:appointment_id) { 100 }
      before { get "/api/v1/appointments/#{appointment_id}", headers: authenticated_header(user) }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
