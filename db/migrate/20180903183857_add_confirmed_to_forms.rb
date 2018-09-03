class AddConfirmedToForms < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :confirmed, :boolean, default: false
  end
end
