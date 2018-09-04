require 'rails_helper'

describe 'a teacher can view all their students' do
  describe 'from their dashboard page' do
    it 'clicks show all students and they can view all students' do
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
     expect(page).to have_content("#{student.last_name}, #{student.first_name}")
     expect(page).to have_content("#{form.mood}")
     expect(page).to have_content("#{form.worked_hard_at}")
     expect(page).to have_content("#{form.done_better_at}")
     expect(page).to have_content("#{form.favorite_part}")
    end
  end
end
