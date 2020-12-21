class ChangeUserProfileColumn < ActiveRecord::Migration[6.0]
  def up
    change_column :user_profiles, :age, :integer
    change_column :user_profiles, :job, :string, limit: 20
    change_column :user_profiles, :total_assets, :integer
    change_column :user_profiles, :annual_income, :integer
    change_column :user_profiles, :monthly_income, :integer
    change_column :user_profiles, :household_member, :integer
    change_column :user_profiles, :residence, :string
  end
  def down
    change_column :user_profiles, :age, :integer, default: 0
    change_column :user_profiles, :job, :string, default: '', limit: 20
    change_column :user_profiles, :total_assets, :integer, default: 0
    change_column :user_profiles, :annual_income, :integer, default: 0
    change_column :user_profiles, :monthly_income, :integer, default: 0
    change_column :user_profiles, :household_member, :integer, default: 0
    change_column :user_profiles, :residence, :string, default: 0
  end

end
