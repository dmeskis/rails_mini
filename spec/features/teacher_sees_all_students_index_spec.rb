require 'rails_helper'

describe 'User visits student index page' do
  context 'as a teacher' do
    it 'allows teacher to see all students' do
      teacher = User.create(username: "teacher",
                            email: "email@email.com",
                            password: "password",
                            role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit teacher_students_path
      expect(page).to have_content("All Students")
    end
  end
end
