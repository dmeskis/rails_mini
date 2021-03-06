class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :role, default: 0
      t.string :email
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.string :image, default: "/default_user.png"
    end
  end
end
