FactoryBot.define do
  factory :comment do
    text { 'It is realy nice!' }
    association :user, factory: :user
    association :post, factory: :post
  end
end
