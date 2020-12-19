class ChangeDefaultResidenceToUserProfile < ActiveRecord::Migration[6.0]
  def up
    change_column :user_profiles, :residence, :string, null: false, default: "", after: :job
  end
  def down
    change_column :user_profiles, :residence, :string
  end
end
