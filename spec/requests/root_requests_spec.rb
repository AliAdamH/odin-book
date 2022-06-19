require 'rails_helper'

RSpec.describe 'GET /', type: :request do

  context 'when an unauthenticated user visits the root page' do
    it 'responds with the login page successfully' do
      get '/'
      expect(response).to be_successful
      expect(response.body).to include('Log in')
    end
  end

  context 'when an authenticated user visits the root page' do
    before do
      user = create(:user)
      sign_in user
    end
    it 'responds with the feed of the user successfully' do
      get '/'
      expect(response).to be_successful
      expect(response.body).to include('Post something:')
    end
  end
end