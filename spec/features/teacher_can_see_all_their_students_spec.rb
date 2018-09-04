require 'rails_helper'

describe 'a teacher can view all their students' do
  describe 'from their dashboard page' do
    it 'clicks show all students and they can view all students' do
      teacher = create(:user)
      student = teacher.students.create!(first_name: "Billy", last_name: "Madison")
      student_2 = teacher.students.create!(first_name: "Mia", last_name: "Khalifa")
      student_3 = teacher.students.create!(first_name: "Allison", last_name: "Diehl")


     visit '/'

     click_on "Log In"

     expect(current_path).to eq(login_path)

     fill_in "username", with: teacher.username
     fill_in "password", with: teacher.password

     within(".card-body") do
       click_on "Log In"
     end

     click_on "View all of your students"

     expect(page).to have_content("#{student.last_name}, #{student.first_name}")
     expect(page).to have_content("#{student_2.last_name}, #{student_2.first_name}")
     expect(page).to have_content("#{student_3.last_name}, #{student_3.first_name}")
    end
  end
end
