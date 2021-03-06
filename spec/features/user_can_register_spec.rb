require 'rails_helper'

describe 'User can register' do
  context 'user clicks on sign up' do
    scenario 'user enters valid registration info, clicks submit, and is added to db' do
      username = "user123"

      visit '/'

      click_on "Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in :user_email, with: "user@mail.com"
      fill_in :user_username, with: username
      fill_in :user_password, with: "password"
      fill_in :user_first_name, with: "Bob"
      fill_in :user_last_name, with: "Saget"

      click_on "Create Account"
      expect(page).to have_content("#{username}")
    end
  end
end
