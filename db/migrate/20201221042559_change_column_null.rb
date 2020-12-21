class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :user_profiles, :age, true
    change_column_null :user_profiles, :job, true
    change_column_null :user_profiles, :total_assets, true
    change_column_null :user_profiles, :annual_income, true
    change_column_null :user_profiles, :monthly_income, true
    change_column_null :user_profiles, :household_member, true
    change_column_null :user_profiles, :residence, :integer, true
  end
  def down
    change_column_null :user_profiles, :age, false
    change_column_null :user_profiles, :job, false
    change_column_null :user_profiles, :total_assets, false
    change_column_null :user_profiles, :annual_income, false
    change_column_null :user_profiles, :monthly_income, false
    change_column_null :user_profiles, :household_member, false
    change_column_null :user_profiles, :residence, :integer, false
  end
end
