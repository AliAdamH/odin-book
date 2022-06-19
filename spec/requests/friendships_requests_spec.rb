require 'rails_helper'
RSpec.describe "Friendship", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "POST friendship#create" do
    it 'responds successfully and redirects to the feed' do
      friendship_request = create(:friendship_request, addressee: user)
      post friendships_path(
        friend_id: friendship_request.requester_id,
        request_id: friendship_request.id
      )
    
      expect(response.status).to eq 302
      expect(response).to redirect_to(authenticated_root_path)
    end
  end
end