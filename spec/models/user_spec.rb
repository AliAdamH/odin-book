require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'Validations' do

    it 'requires and email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'requires a valid  password' do
      expect(build(:user, :invalid_password)).not_to be_valid
    end
  end

  context 'Associations' do
    it 'has many posts' do
      expect(described_class.reflect_on_association(:posts).macro).to eq(:has_many)
    end

    it 'has many likes' do
      expect(described_class.reflect_on_association(:likes).macro).to eq(:has_many)
    end

    it 'has many comments' do
      expect(described_class.reflect_on_association(:comments).macro).to eq(:has_many)
    end

    it 'has many friends' do
      expect(described_class.reflect_on_association(:friends).macro).to eq(:has_many)
    end

    it 'has many friendship requests' do
      expect(described_class.reflect_on_association(:friendship_requests).macro).to eq(:has_many)
    end

    it 'has many to accept friendship requests' do
      expect(described_class.reflect_on_association(:to_accept_requests).macro).to eq(:has_many)
    end
  end


  describe '#send_success_email' do
    context 'When a new user signs up' do
      it 'Sends him an email' do
        user = build(:user)
        expect(user).to receive(:send_success_email)
        user.save
      end
    end
  end
end
