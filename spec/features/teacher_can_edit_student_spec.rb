require 'rails_helper'

describe 'a teacher can edit a student' do
  describe 'from their index page' do
    it 'clicks edit student and they can edit that student' do
      teacher = create(:user)
      student = teacher.students.create!(first_name: "Billy", last_name: "Madison")
      form = student.forms.create!(mood: "Happy",
                                  worked_hard_at: "Stuff",
                                  done_better_at: "Things",
                                  favorite_part: "Lunch",
                                  confirmed: 0)
     visit '/'

     click_on "Log In"

     expect(current_path).to eq(login_path)

     fill_in "username", with: teacher.username
     fill_in "password", with: teacher.password

     within(".card-body") do
       click_on "Log In"
     end

     visit teacher_student_path(student)

     click_on "Edit Student"
     expect(current_path).to eq(edit_teacher_student_path(student))

     fill_in :student_first_name, with: "Jesus"
     click_on "Confirm Changes"
     expect(current_path).to eq(teacher_student_path(student))
     expect(page).to have_content("Jesus")
    end
  end
end
