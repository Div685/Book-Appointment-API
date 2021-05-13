require 'rails_helper'

RSpec.describe "Logins", type: :request do

  let!(:user) { create(:user) }
  
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

  describe "Post /api/v1/login" do

    let(:valid_attributes) do
      {
        user: {
          username: user.username, 
          password: user.password,  
        }
      }
    end

    let(:invalid_attributes) do
      {
        user: {
          username: '', 
          password: 'Learn',  
        }
      }
    end

    context 'when credintials are correct' do
      before { post '/api/v1/login', params: valid_attributes, headers: authenticated_header(user) }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when credintials are Incorrect' do
      before { post '/api/v1/login', params: invalid_attributes }
      
      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Invalid Password/)
      end
    end
  end
end
