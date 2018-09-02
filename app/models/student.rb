class Student < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :students_users
  has_many :users, through: :students_users
end
