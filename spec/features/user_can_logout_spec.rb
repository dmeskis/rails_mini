require 'rails_helper'

describe 'User can log out' do
  describe 'on their dashboard page' do
    it 'lets user log out by clicking log out' do
      user = create(:user)

      visit '/'

      click_on "Log In"

      expect(current_path).to eq(login_path)

      fill_in "username", with: user.username
      fill_in "password", with: user.password

      within(".card-body") do
        click_on "Log In"
      end

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Welcome, #{user.username}")

      click_on "Log Out"
      expect(current_path).to eq('/')
    end
  end
end
