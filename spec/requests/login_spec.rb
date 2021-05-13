require 'rails_helper'

RSpec.describe "Logins", type: :request do
  # let!(:users) { create_list(:user, 10) }
  # let(:user_id) { users.first.id }
  let!(:username) {'Learn'}
  let!(:password) { 'Internet.password' }
  
  describe "Post /login" do
    let(:valid_attributes) do
      {
        user: {
          username: 'Learn', 
          password: 'Internet.password',  
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

    # context 'when credintials are correct' do
    #   before { post '/login', params: valid_attributes }
      
    #   it 'returns status code 200' do
    #     expect(response).to have_http_status(201)
    #   end
    # end

    context 'when credintials are Incorrect' do
      before { post '/login', params: invalid_attributes }
      
      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/invalid User/)
      end
    end
  end
end
