require 'rails_helper'

RSpec.describe "User sign-in", type: :system do

  context 'when user credentials are invalid' do
    it 'shows Invalid credentials alert' do
      visit unauthenticated_root_path
      click_link 'Login'
      fill_in 'user_email', with: 'somefakemail@mail.com'
      fill_in 'user_password', with: "fakepwd"
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end


  context 'when the user credentials are valid' do
    it 'redirects to authenticated root path' do
      user = create(:user)
      visit unauthenticated_root_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'

      expect(page).to have_current_path(authenticated_root_path)
      expect(page).to have_link('Profile')
    end
  end
end