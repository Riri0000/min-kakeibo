class ChangeUserProfileColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user_profiles, :age, nil
    change_column_default :user_profiles, :job, nil
    change_column_default :user_profiles, :total_assets, nil
    change_column_default :user_profiles, :annual_income, nil
    change_column_default :user_profiles, :monthly_income, nil
    change_column_default :user_profiles, :household_member, nil
    change_column_default :user_profiles, :residence, nil
  end
end
