require 'rails_helper'

RSpec.feature "Likes", type: :system do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  context 'When a user likes a post' do
    it 'Changes the likes count' do
      post = create(:post, user: user)
      visit authenticated_root_path
      expect(post.likes.count).to be_zero
      expect(page).to have_content(post.body)

      find(:css, 'i.fa.fa-heart').click

      expect(post.likes.count).to eq(1)
      expect(page).to have_selector('i.fa.fa-thumbs-down')
    end
  end

  context 'When a user dislikes the post' do
    it 'Changes the likes count' do
      post = create(:post, user: user)
      like = create(:like, post: post, user: user)

      visit authenticated_root_path
      find(:css, 'i.fa.fa-thumbs-down').click
      expect(post.likes.count).to be_zero
      expect(page).to have_selector('i.fa.fa-heart')
    end
  end
end