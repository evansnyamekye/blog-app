FactoryBot.define do
  factory :user do
    name { 'Evans k. Nyamekye' }
    photo { 'example.jpg' }
    bio { 'Worry less ..everthing will be fine' }
    posts_counter { 0 }
  end
end
