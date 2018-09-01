require 'rails_helper'

describe 'user can create new student' do
  context 'as a teacher' do
    it 'can create a new student and assign him guardians' do
      teacher = User.create(username: "Teacher",
                            password: "password",
                            email: "email@email.com",
                            role: 1)

      visit login_path

      fill_in "username", with: teacher.username
      fill_in "password", with: teacher.password

      click_on "Log In"

      click_on "Add a Student"
      expect(current_path).to eq(new_teacher_student_path)

      fill_in "student[first_name]", with: "Billy"
      fill_in "student[last_name]", with: "Madison"
      click_on "Create Student"
      expect(current_path).to eq(teacher_student_path)
    end
  end
end
