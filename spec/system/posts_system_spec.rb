require 'rails_helper'
RSpec.feature "Posts", type: :system do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  context "When a user creates a post" do
    it 'appears on his feed' do
      post_body = 'Something interesting to say'
      visit authenticated_root_path
      fill_in 'post_body', with: post_body
      click_button 'Create Post'

      expect(page).to have_content(post_body)
    end
  end
end