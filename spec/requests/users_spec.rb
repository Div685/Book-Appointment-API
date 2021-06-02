require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  describe 'Post /users' do
    let(:valid_attributes) do
      {
        user: {
          username: 'Learn Elm',
          password: 'Learn'
        }
      }
    end

    let(:invalid_attributes) do
      {
        user: {
          username: '',
          password: 'Learn'
        }
      }
    end

    context 'when credintials are correct' do
      before { post '/api/v1/users', params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when credintials are Incorrect' do
      before { post '/api/v1/users', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Username can't be blank/)
      end
    end
  end
end
