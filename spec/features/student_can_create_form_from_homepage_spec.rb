require 'rails_helper'

describe 'a student can create form' do
  describe 'navigating from the landing page' do
    scenario 'student clicks through the options to get to a form and fills it out' do
      teacher = create(:user)
      student = teacher.students.create(first_name: "Billy", last_name: "Boy")

      visit root_path
      click_on "Student"
      expect(current_path).to eq(forms_select_teacher_path)
      click_on "#{teacher.first_name} #{teacher.last_name}"
      expect(current_path).to eq(forms_select_student_path)
      click_on "#{student.first_name} #{student.last_name}"

      fill_in "form[mood]", with: "Happy"
      fill_in "form[worked_hard_at]", with: "Following rules"
      fill_in "form[done_better_at]", with: "Being a good friend"
      fill_in "form[favorite_part]", with: "Being a good friend"

      click_on "Submit"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Thank you for filling out your form, #{student.first_name}")

    end
  end
end
