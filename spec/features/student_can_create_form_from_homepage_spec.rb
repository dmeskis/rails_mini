require 'rails_helper'

describe 'a student can create form' do
  describe 'navigating from the landing page' do
    scenario 'student clicks through the options to get to a form and fills it out' do
      teacher = User.create!(username: "teacher",
                             email: "teacher@mail.com",
                             password: "password",)
    end
  end
end
