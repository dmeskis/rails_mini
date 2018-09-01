require 'rails_helper'

describe 'User can log in' do
  describe 'on the landing page' do
    it 'lets user click login if they already have an account' do
      user = User.create(username: "Vagrant", password: "password")

      visit '/'

      click_on "I already have an account"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "username", with: user.password

      click_on "Log in"

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content("Log out")
    end
  end
end
