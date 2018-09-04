require 'rails_helper'

describe 'User can edit profile' do
  describe 'logged in user' do
    it 'can edit profile' do
      user = create(:user)

      visit '/'

      click_on "Log In"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "password", with: user.password

      within(".card-body") do
        click_on "Log In"
      end

      visit edit_user_path(user)

      fill_in :user_password, with: "new_password"
      fill_in :user_first_name, with: "Bob"
      fill_in :user_last_name, with: "Saget"
      fill_in :user_phone, with: "815 260 4105"
      click_on "Confirm Changes"

      expect(current_path).to eq(user_path(user))
      save_and_open_page
      expect(page).to have_content("Bob")
      expect(page).to have_content("Saget")
    end
  end
end
