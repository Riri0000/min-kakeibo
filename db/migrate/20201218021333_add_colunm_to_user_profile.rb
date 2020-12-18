class AddColunmToUserProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :residence, :integer, default: 0, null: false
  end
end
