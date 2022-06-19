FactoryBot.define do
  factory :friendship_request do
    requester { create(:user) }
    addressee { create(:user) }
    status { 0 }
  end
end