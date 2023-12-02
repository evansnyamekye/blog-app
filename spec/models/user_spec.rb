require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  it 'is not valid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user = FactoryBot.build(:user, posts_counter: -1)
    expect(user).not_to be_valid
  end

  it 'is valid with a non-negative posts_counter' do
    user = FactoryBot.build(:user, posts_counter: 0)
    expect(user).to be_valid
  end

  # Method test
  describe '#three_recent_posts' do
    it 'returns three most recent posts' do
      user = FactoryBot.create(:user)
      FactoryBot.create(:post, author: user, created_at: 4.days.ago)
      recent_posts = FactoryBot.create_list(:post, 3, author: user)

      expect(user.three_recent_posts).to eq(recent_posts.reverse)
    end
  end
end
