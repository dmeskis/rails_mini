require 'rails_helper'

describe 'User can edit profile' do
  describe 'logged in user' do
    it 'can edit profile' do
      user = create(:user)

      visit '/'

      click_on "Log In"

      expect(current_path).to eq(login_path)

      fill_in "username", with: teacher.username
      fill_in "password", with: teacher.password

      within(".card-body") do
        click_on "Log In"
      end

      visit edit_user_path(user)

      fill_in :user_password, with: "new_password"
      fill_in :user_email, with: "new_email@mail.com"
      fill_in :user_first_name, with: "Bob"
      fill_in :user_last_name, with: "Saget"
      click_on "Confirm Changes"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Bob")
      expect(page).to have_content("Saget")
    end
  end
end
