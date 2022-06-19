require 'rails_helper'
RSpec.describe 'Posts', type: :request do

  let(:user) { create(:user) }
  
  before do
    sign_in user
  end
  describe "POST /posts" do

    context 'When a user submits a new post' do
      it 'Redirects him back to the feed' do
        submitted_text = 'Some text for tests of course !'
        post posts_path(
          post: {
            body: submitted_text
          }
        )
        expect(response.status).to be 302
        expect(response).to redirect_to(posts_path)
      end
    end
  end


  describe "DELETE /posts" do
    context 'When a user confirms the deletion of his post' do
      it 'redirects him back to the feed' do
        post = create(:post, user: user)
        delete post_path(
          id: post.id
        )
        expect(response.status).to eq 302
        expect(response).to redirect_to(posts_path)
      end
    end
  end
end