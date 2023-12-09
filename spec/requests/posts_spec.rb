require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index'
  it 'return a success response' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:post, author: user)
    get user_posts_path(user)
    expect(response).to have_http_status(:success)
  end

  it 'renders the index template' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:post, author: user)
    get user_posts_path(user)
    expect(response).to render_template(:index)
  end

  it 'includes correct placeholder text in the response body' do
    user = FactoryBot.create(:user)
    FactoryBot.create(:post, author: user)
    get user_posts_path(user)
    expect(response.body).to include('Great Quotes')
  end
end

describe 'GET #show' do
  it 'returns a success responese' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, author: user)
    get user_post_path(user, post)
    expect(response).to have_http_status(:success)
  end

  it 'renders the show template' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, author: user)
    get user_post_path(user, post)
    expect(response).to render_template(:show)
  end

  it 'includes correct placeholder text in the response body' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, author: user)
    get user_post_path(user, post)
    expect(response.body).to include('Great Quotes')
  end
end
