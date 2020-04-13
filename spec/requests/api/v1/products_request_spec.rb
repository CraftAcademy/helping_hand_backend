require 'rails_helper'

RSpec.describe "Api::V1::ProductsController", type: :request do
  let!(:products) { 5.times {create(:product) } }

  describe 'GET /products' do
    before do
      get '/api/v1/products'
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end
  end
end