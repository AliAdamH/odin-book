FactoryBot.define do
  
  factory :comment do
    content { "Any valid text really!" }
    user { create(:user) }
    post { create(:post) }
  end

end