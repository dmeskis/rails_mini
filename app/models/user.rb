class User < ApplicationRecord
  validates_presence_of :name, :phone, :role, :email, :password, :image
end
