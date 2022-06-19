require 'rails_helper'
RSpec.feature "Comments", type: :system do

  let(:user) { create(:user) }

  before do
    sign_in user
  end


  context 'When a user comments on a post' do
    it 'displays its contents on the post\'s show page' do
      post = create(:post, user: user)
      comment_content = 'This comment is not controversial'
      visit post_path(post)

      expect(page).to have_content(post.body)


      fill_in 'comment_content', with: comment_content
      click_button 'Create Comment'

      expect(page).to have_content(comment_content)
    end
  end
end