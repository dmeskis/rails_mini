class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  has_secure_password
  enum role: %w(guardian teacher)
  has_many :students_users
  has_many :students, through: :students_users
end
