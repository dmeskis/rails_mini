class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.references :student, foreign_key: true
      t.string :mood
      t.string :worked_hard_at
      t.string :done_better_at
      t.string :favorite_part

      t.timestamps
    end
  end
end
