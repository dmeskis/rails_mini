require 'rails_helper'

describe 'a teacher can view a student' do
  describe 'on their show page' do
    it 'shows all that students forms' do
      teacher = create(:user)
      student = teacher.students.create!(first_name: "Billy", last_name: "Madison")
      form = student.forms.create!(mood: "Happy",
                                  worked_hard_at: "Stuff",
                                  done_better_at: "Things",
                                  favorite_part: "Lunch",
                                  confirmed: 0)
      form_2 = student.forms.create!(mood: "Sad",
                                  worked_hard_at: "Things",
                                  done_better_at: "Stuff",
                                  favorite_part: "Recess",
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
     save_and_open_page
     expect(page).to have_content("#{student.last_name}, #{student.first_name}")
     expect(page).to have_content("#{form.created_at.strftime("%F")}")
     expect(page).to have_content("#{form_2.created_at.strftime("%F")}")
    end
  end
end
