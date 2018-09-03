FactoryBot.define do
  factory :user do
    username "Teacher"
    password "Password"
    email "email@mail.com"
    role 1
    first_name "Sophie"
    last_name "Meskis"
    image "/teacher-sitting-at-desk.png"
  end
end
