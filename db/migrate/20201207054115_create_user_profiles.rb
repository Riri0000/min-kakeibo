class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :age, null: false, default: 0
      t.string :job, null: false, default: '', limit: 20
      t.integer :total_assets, null: false, default: 0
      t.integer :annual_income, null: false, default: 0
      t.integer :monthly_income, null: false, default: 0
      t.integer :household_member, null: false, default: 0
      t.text :message, limit: 144

      t.timestamps
    end
  end
end
