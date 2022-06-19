require 'rails_helper'
RSpec.feature "FriendshipRequest", type: :system do

  let(:primary_user) { create(:user) }

  before do
    sign_in primary_user
  end

  context 'When a user sends a friendship request through the user index' do

    it 'displays a success message' do
      secondary_user = create(:user, username: 'Hithere!')
      visit users_path
      expect(page).to have_content(secondary_user.username)

      click_button('Send friend request')

      expect(page).to have_content('Your request have been successfully sent')
    end

    it 'removes the user from the user\'s user index list' do
      secondary_user = create(:user, username: 'Another!')
      visit users_path
      expect(page).to have_content(secondary_user.username)

      click_button('Send friend request')

      expect(page).not_to have_content(secondary_user.username)
    end
  end


  context 'When a user has friendship requests to accept' do

    context 'When he accepts the request' do
      it 'Displays the success message' do
        friendship_request = create(:friendship_request, addressee:primary_user)
        visit authenticated_root_path
        within(:css, '.has-dropdown') do
          find(:css, 'a.navbar-link').hover
          expect(page).to have_content(friendship_request.requester.username)
          click_button 'Accept'
        end

        expect(page).to have_content('Success !')
      end
    end

    context 'When he refuses the request' do
      it 'Removes the request from his requests dropdown' do
        friendship_request = create(:friendship_request, addressee: primary_user)
        visit authenticated_root_path
        within(:css, '.has-dropdown') do
          find(:css, 'a.navbar-link').hover
          expect(page).to have_content(friendship_request.requester.username)
          click_button 'Refuse'
        end

        find(:css, 'a.navbar-link').hover
        expect(page).to have_content('No pending friend requests')
      end
    end
  end
end