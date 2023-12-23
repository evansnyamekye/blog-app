require 'rails_helper'

describe 'Post Show Page', type: :feature do
  let(:post) { create(:post, author: user) }
  let(:user) { create(:user) }
  let(:comments) { create_list(:comment, 3, author: user, post:) }
  before do
    comments
    visit user_post_path(user, post)
  end

  describe 'Post section page' do
    it "displays the post's title" do
      expect(page).to have_content(post.title)
    end

    it 'displays the author of the post' do
      expect(page).to have_content(post.author.name)
    end

    it 'displays the number of comments' do
      expect(page).to have_content(post.comments.count)
    end

    it 'displays the number of likes' do
      expect(page).to have_content(post.likes.count)
    end

    it 'displays the post body' do
      expect(page).to have_content(post.body)
    end

    it 'displays the username of each commentor' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.user.username)
      end
    end

    it 'displays the comment each commentor left' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.body)
      end
    end
  end
end
