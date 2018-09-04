require 'rails_helper'

describe 'a teacher can delete forms' do
  describe 'on a student forms page' do
    it 'can delete a form' do
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

      click_on "Delete"
      expect(Form.count).to eq(0)
    end
  end
end
