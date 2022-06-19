require 'rails_helper'
RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  before do
    sign_in user
  end 

  describe "POST comments#create" do
    it 'responds successfully and redirects to the commented post' do
      comment = build(:comment, user: user)
      post post_comments_path(
        comment: {
          content: comment.content
        },
        post_id: comment.post_id
      )

      expect(response.status).to eq 302
      expect(response).to redirect_to(post_url(comment.post))
    end
  end

end