require 'rails_helper'
RSpec.describe "Likes", type: :request do
 let(:user) { create(:user) } 
  before do
    sign_in user
  end

  describe "POST likes#create" do
    it 'responds successfully and redirects' do
      like = build(:like)
      post likes_path(
        like: { post_id: like.post_id }
      )

      expect(response.status).to eq 302
    end
  end


  describe "DELETE likes#destroy" do
    it 'responds successfully and redirects' do
      like = create(:like, user: user)
      delete like_url(
        id: like.id
      )

      expect(response.status).to eq 302
    end
  end

end