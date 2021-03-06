class Student < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :students_users
  has_many :users, through: :students_users
  has_many :forms, dependent: :destroy

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
