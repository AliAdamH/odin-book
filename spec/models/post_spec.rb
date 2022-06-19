require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'has a valid factory' do
    expect(build(:post)).to be_valid
  end 

  context 'Associations' do
    it 'belongs to a user' do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has many likes' do
      expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end


  describe '.timeline' do
    context 'When a user requests his timeline' do
      it 'returns his posts' do
        user = create(:user)
        post = create(:post, user: user)
        expect(Post.timeline(user)).to include(post)
      end

      it 'returns his friend\'s posts' do
        user = create(:user)
        friend = create(:user)
        friendship = create(:friendship, user: user, friend: friend)
        friend_post = create(:post, user: friend)
        expect(Post.timeline(user)).to include(friend_post)
      end
    end
  end
end