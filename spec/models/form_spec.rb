require 'rails_helper'

RSpec.describe Form, type: :model do
  describe "validations" do
    it {should validate_presence_of(:student_id)}
    it {should validate_presence_of(:mood)}
    it {should validate_presence_of(:worked_hard_at)}
    it {should validate_presence_of(:done_better_at)}
    it {should validate_presence_of(:favorite_part)}
  end
end
