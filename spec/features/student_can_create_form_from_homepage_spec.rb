require 'rails_helper'

describe 'a student can create form' do
  describe 'navigating from the landing page' do
    scenario 'student clicks through the options to get to a form and fills it out' do
      teacher = create(:user)
      student = create(:student)

      visit root_path
      click_on "Student"

      click_on "#{teacher.first_name} #{teacher.last_name}"

      click_on "#{student.first_name} #{student.last_name}"

      fill_in "form[mood]", with: "Happy"
      fill_in "form[worked_hard_at]", with: "Following rules"
      fill_in "form[done_better_at]", with: "Being a good friend"
      fill_in "form[favorite_part]", with: "Being a good friend"

      click_on "Submit"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Thanks for filling out your form, #{student.first_name} #{student.last_name}")

    end
  end
end
