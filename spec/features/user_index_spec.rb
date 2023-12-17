require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  let(:users) { create_list(:user, 5) }

  before(:each) do
    users
    visit users_path
  end

  scenario 'displays correct number of users' do
    expect(page).to have_selector('.user', count: User.count)
  end

  scenario 'displays all users photo' do
    User.all.each do |_user|
      expect(page).to have_css("img[alt='User Photo']")
    end
  end

  scenario 'displays all users names' do
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario 'displays all users posts count' do
    User.all.each do |user|
      expect(page).to have_content("Posts: #{user.posts.count}")
    end
  end

  scenario 'redirects to user show page when clicked' do
    User.all.each do |user|
      click_link user.name
      expect(current_path).to eq(user_path(user))
      visit users_path
    end
  end
end
