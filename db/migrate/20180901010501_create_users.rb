class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :role
      t.string :email
      t.string :phone
      t.string :image
    end
  end
end
