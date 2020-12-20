class ChangeDataResidenceToUserProfile < ActiveRecord::Migration[6.0]
  def change
    change_column :user_profiles, :residence, :string
  end
end
