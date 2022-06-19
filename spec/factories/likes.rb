FactoryBot.define do

  factory :like do
    user { }
    post { create(:post) }
  end

end