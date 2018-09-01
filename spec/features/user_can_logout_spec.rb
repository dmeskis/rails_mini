require 'rails_helper'

describe 'User can log out' do
  describe 'on their show page' do
    it 'lets user log out by clicking log out' do
      user = User.create!(username: "Vagrant", email: "email@mail.com", password: "password")

      visit '/'

      click_on "I already have an account"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "password", with: user.password

      click_on "Log In"

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Welcome, #{user.username}")

      click_on "Log Out"
      expect(current_path).to eq('/')
      expect(session[:user_id]).to eq(nil)
    end
  end
end
