require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end
  describe "GET users#index" do
    it 'responds successfully  with the list of all the OTHER users' do
      get users_path
      expect(response.status).to eq 200
      expect(response).to render_template(:index)
    end
  end


  describe "GET users#show" do
    it 'responds successfully with the profile of a user' do
      get user_path(
        id: user.id
      )
      expect(response.status).to eq 200
      expect(response).to render_template(:show)
    end
  end

  describe "GET users#edit" do
    it 'responds successfully with the editing form of a user' do
      get edit_user_path(
        id: user.id 
      )
      expect(response.status).to be 200
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH users#update" do
    it 'responds successfully with the user\'s profile page' do
      patch user_path(
        user: {
          username: 'Things'
        },
        id: user.id
      )
      expect(response.status).to eq 302
      expect(response).to redirect_to(user_url(user))
    end
  end
end