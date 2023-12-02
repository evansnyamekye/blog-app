FactoryBot.define do
  factory :user do
    name { 'Sadaf Daneshgar' }
    photo { 'example.jpg' }
    bio { 'Worry less smile more 😍' }
    posts_counter { 0 }
  end
end
