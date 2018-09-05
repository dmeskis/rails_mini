require 'rails_helper'

describe 'a teacher can view all their students' do
  describe 'from their dashboard page' do
    it 'clicks show all students and they can view all students' do
      teacher = create(:user)
      student = teacher.students.create!(first_name: "Billy", last_name: "Madison")
      student_2 = teacher.students.create!(first_name: "Mia", last_name: "Khalifa")
      student_3 = teacher.students.create!(first_name: "Allison", last_name: "Diehl")
      parent_1 = student.users.create!(first_name: "Mom",
                            last_name: "Dad",
                            username: "momdad",
                            email: "momdad@mail.com",
                            password: "password",
                            role: 0)
      parent_2 = student_2.users.create!(first_name: "Mom",
                            last_name: "Dad",
                            username: "momdad2",
                            email: "momdad2@mail.com",
                            password: "password",
                            role: 0)
      parent_3 = student_3.users.create!(first_name: "Mom",
                            last_name: "Dad",
                            username: "momdad3",
                            email: "momdad3@mail.com",
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

     click_on "View all parents"
     expect(page).to have_content("#{parent_1.last_name}, #{parent_1.first_name}")
     expect(page).to have_content("#{parent_2.last_name}, #{parent_2.first_name}")
     expect(page).to have_content("#{parent_3.last_name}, #{parent_3.first_name}")
    end
  end
end
