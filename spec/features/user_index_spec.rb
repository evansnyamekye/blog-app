require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  let(:users) { create_list(:user, 5) }

  before(:each) do
    users
    visit users_path
  end

  describe 'User index page' do
    it 'displays correct number of users' do
      expect(page).to have_css('div.user_info', count: 5)
    end

    describe 'displays all users photo' do
      user.each do |_user|
        expect(page).to have_css("img[alt='User Photo']")
      end
    end

    describe 'displays all users names' do
      user.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    describe 'displays all users posts count' do
      user.each do |user|
        expect(page).to have_content(user.posts.count)
      end
    end

    # redirect to a new page when clicked
    describe 'redirects to user show page when clicked' do
      find_all('a', text: users.first.name)[0].click
      expect(page).to have_current_path(user_path(users.first))
    end
  end
end
