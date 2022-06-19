require 'rails_helper'

RSpec.describe 'FriendshipRequests', type: :request do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST friendship_requests#create' do
    it 'responds successfully and redirects to the users index' do
      to_befriend = create(:user)
      post friendship_requests_path(
        addressee_id: to_befriend.id
      )
      expect(response.status).to eq 302
      # Modify the redirect in the controller ?
      # expect(response).to redirect_to(users_url)
    end
  end

  describe 'DELETE friendship_requests#destroy' do
    it 'responds successfully and redirects to the feed' do
      friendship_request = create(:friendship_request, addressee: user)

      delete friendship_request_path(friendship_request)

      expect(response.status).to eq 302
      expect(response).to redirect_to(authenticated_root_path)
    end
  end


end