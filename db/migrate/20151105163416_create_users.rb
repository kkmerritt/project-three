class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token

      t.timestamps null: false
    end
    add_index :users, :email
  end
end
