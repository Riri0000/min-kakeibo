class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt
      t.string :profile_image
      t.integer :role, null: false, default: 0
      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
  end
end
