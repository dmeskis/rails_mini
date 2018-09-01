require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}
    # it {should validate_presence_of(:role)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
  end
  describe "roles" do
    it "can be created as a teacher" do
      user = User.create(username: "teacher",
                         password: "password",
                         email: "email@mail.com",
                         role: 1)
      expect(user.role).to eq("teacher")
      expect(user.teacher?).to be_truthy
    end
    it "can be created as a parent" do
      user = User.create(username: "parent",
                         password: "pass")
      expect(user.role).to eq("parent")
      expect(user.parent?).to be_truthy
    end
  end
end
