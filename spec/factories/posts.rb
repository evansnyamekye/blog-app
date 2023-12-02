FactoryBot.define do
  factory :post do
    title { 'Godfather' }
    text { 'Keeping the family secret' }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user
  end
end
