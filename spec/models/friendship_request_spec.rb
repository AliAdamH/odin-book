require 'rails_helper'

RSpec.describe FriendshipRequest, type: :model do

  it 'has a valid factory' do
    expect(build(:friendship_request)).to be_valid
  end

end