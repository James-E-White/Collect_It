require 'rails_helper'

RSpec.describe 'API Intergration Test', type: :request do
    it 'returns a successful response' do
    api_key = '0c0ed76f5b3287b8d20c173884b75ead456b2ea3'
    headers = { 'Authorization': "Bearer #{api_key}" }

    get '/users/discover', headers: headers

    expect(response).to have_http_status(:redirect)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end
end