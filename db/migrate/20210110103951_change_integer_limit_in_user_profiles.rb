class ChangeIntegerLimitInUserProfiles < ActiveRecord::Migration[6.0]
  def change
    change_column :user_profiles, :total_assets, :integer, limit: 5
    change_column :user_profiles, :annual_income, :integer, limit: 5
    change_column :user_profiles, :monthly_income, :integer, limit: 5
  end
end
