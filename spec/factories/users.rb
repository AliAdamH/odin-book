FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}default#{n}@email.com" }
    password { 'very$secure$password' }
    password_confirmation { 'very$secure$password' }

    trait :invalid_password do
      password { 12345 }
      password_confirmation { 12345 }
    end
  end
end
