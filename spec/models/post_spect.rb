require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is not valid without a title' do
    post = FactoryBot.build(:post, title: nil, author: user)
    expect(post).not_to be_valid
  end

  it 'is valid with a title and other attributes' do
    post = FactoryBot.build(:post, author: user)
    expect(post).to be_valid
  end

  it 'is not valid with a title exceeding 250 characters' do
    post = FactoryBot.build(:post, title: 'a' * 251, author: user)
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post = FactoryBot.build(:post, comments_counter: -1, author: user)
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post = FactoryBot.build(:post, likes_counter: -1, author: user)
    expect(post).not_to be_valid
  end

  it 'returns five most recent comments' do
    post = FactoryBot.create(:post, author: user)
    FactoryBot.create_list(:comment, 3, post:, created_at: 4.days.ago)
    recent_comments = FactoryBot.create_list(:comment, 5, post:)

    expect(post.five_most_recent_comments).to eq(recent_comments.reverse)
  end

  it 'updates author\'s posts_counter after save' do
    expect(user.posts_counter).to eq(0)

    FactoryBot.create(:post, author: user)
    user.reload

    expect(user.posts_counter).to eq(1)
  end
end
