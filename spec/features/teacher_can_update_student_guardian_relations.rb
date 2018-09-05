require 'rails_helper'

describe 'a teacher can change student relations' do
  describe 'from their edit page' do
    it 'selects a parent from the dropdown and updates their relation' do
      teacher = create(:user)
      student = teacher.students.create!(first_name: "Billy", last_name: "Madison")
      form = student.forms.create!(mood: "Happy",
                                  worked_hard_at: "Stuff",
                                  done_better_at: "Things",
                                  favorite_part: "Lunch",
                                  confirmed: 0)
      guardian = User.create!(first_name: "Bill",
                              last_name: "O'Reilly",
                              phone: "555 555 5555",
                              email: "bill@mail.com",
                              username: "billy",
                              password: "password",
                              role: 0)
      guardian_2 = User.create!(first_name: "Stan",
                              last_name: "Hope",
                              phone: "555 555 5555",
                              email: "stan@mail.com",
                              username: "stanley",
                              password: "password",
                              role: 0)
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
     select "Bill O'Reilly", :from => "guardianSelect"

     click_on "Confirm Changes"
     expect(current_path).to eq(teacher_student_path(student))
     expect(student.users.last.first_name).to eq("#{guardian.first_name}")
    end
  end
end
