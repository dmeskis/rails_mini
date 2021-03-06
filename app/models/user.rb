class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :first_name, :last_name
  has_secure_password
  enum role: %w(guardian teacher)
  has_many :students_users
  has_many :students, through: :students_users
  has_many :forms, through: :students

  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation

  def full_name
    "#{first_name} #{last_name}"
  end

  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
