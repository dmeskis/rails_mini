class AddConfirmedToForms < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :confirmed, :integer, default: 0
  end
end
