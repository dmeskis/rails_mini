class Form < ApplicationRecord
  validates_presence_of :student_id,
                        :mood,
                        :worked_hard_at,
                        :done_better_at,
                        :favorite_part,
                        :confirmed
  belongs_to :student
end
