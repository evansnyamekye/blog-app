class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes
  has_many :comments, foreign_key: :author_id

  # name must not be blank
  validates :name, presence: true

  # PostsCounter must be an integer greater than or equal to zero.
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  users = User.includes(:posts).limit(10)
  users.each do |user|
    user.posts.each do |post|
      puts post.title
    end
  end
end