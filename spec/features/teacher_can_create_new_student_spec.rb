require 'rails_helper'

describe 'user can create new student' do
  context 'as a teacher' do
    it 'can create a new student and assign him guardians' do
      teacher = create(:user)

      visit login_path

      fill_in "username", with: teacher.username
      fill_in "password", with: teacher.password

      within(".card-body") do
        click_on "Log In"
      end
      expect(current_path).to eq(dashboard_path)
      click_on "Add a Student"
      expect(current_path).to eq(new_teacher_student_path)

      fill_in "student[first_name]", with: "Billy"
      fill_in "student[last_name]", with: "Madison"
      # Add guardians test here
      click_on "Create Student"
      expect(current_path).to eq(user_students_path(teacher))
      expect(page).to have_content "Billy"
      expect(page).to have_content "Madison"
    end
  end
end
