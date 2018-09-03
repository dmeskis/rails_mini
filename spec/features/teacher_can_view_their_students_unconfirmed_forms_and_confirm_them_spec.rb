require 'rails_helper'

describe 'a teacher can confirm forms' do
  describe 'on a student forms page' do
    it 'can confirm, edit, or delete form' do
      teacher = create(:user)
      student = teacher.students.create(first_name: "Billy", last_name: "Madison")
      form = student.forms.create(mood: "Happy",
                                  worked_hard_at: "Stuff",
                                  done_better_at: "Things",
                                  favorite_part: "Lunch",
                                  confirmed: 0)
      # sets session user id to teacher id
      get(:show, session: {user_id: teacher.id})

      visit teacher_students_forms_path

      expect(page).to have_content("Not Confirmed")
      click_on "Confirm"
      expect(page).to have_content("Confirmed")

    end
  end
end
