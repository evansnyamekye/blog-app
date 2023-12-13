class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
