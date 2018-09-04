require 'rails_helper'

describe 'a teacher can confirm forms' do
  describe 'on a student forms page' do
    it 'can confirm form' do
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

      visit teacher_forms_path

      expect(page).to have_content("Not Confirmed")
      save_and_open_page
      click_on "Confirm"
      expect(page).to have_content("Confirmed")
      expect(Form.first.confirmed).to eq(1)
    end
  end
end
