FactoryBot.define do
  factory :post do
    body { 'An Interesting Choice of Words' }
    user { create(:user) }

    trait :blank_invalid do
      body { nil }
    end
  end
end
