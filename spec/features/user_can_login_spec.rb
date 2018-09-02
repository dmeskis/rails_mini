require 'rails_helper'

describe 'User can log in' do
  describe 'on the landing page' do
    it 'lets user click login if they already have an account' do
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
    end
  end
end
