require 'rails_helper'

describe 'User visits student index page' do
  context 'as a teacher' do
    it 'allows teacher to see all students' do
      teacher = User.create(username: "teacher",
                            email: "email@email.com",
                            password: "password",
                            role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

      visit teacher_students_path
      expect(page).to have_content("All Students")
    end
  end
  context 'as guardian' do
    it 'does not allow guardian to see teacher students index' do
      guardian = User.create(username: "Guardian",
                             password: "password",
                             email: "parent@mail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(guardian)

    visit teacher_students_path
    expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
