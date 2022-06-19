require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'has a valid factory' do
    expect(build(:friendship)).to be_valid
  end
end