require 'rails_helper'

RSpec.describe "Items", type: :request do

  # initialize test data
  let!(:items) { create_list(:item, 10) }
  let(:item_id) { items.first.id }

  describe "GET /items" do
    before { get '/items' }

    it 'returns items' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

    # Test suite for POST /todos
  describe 'POST /items' do
    # valid payload
    let(:valid_attributes) do
      {
        item: {
          name: 'Learn Elm', 
          description: 'Learn', 
          img: 'image'  
        }
      }
    end

    let(:invalid_attributes) do
      {
        item: {
          name: '', 
          description: 'Foo', 
        }
      }
    end

    context 'when the request is valid' do
      before { post '/items', params: valid_attributes }

      it 'creates a items' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/items', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end

  end

    # Test suite for GET /todos/:id
  describe 'GET /items/:id' do
    before { get "/items/#{item_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:item_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

    end
  end
end
