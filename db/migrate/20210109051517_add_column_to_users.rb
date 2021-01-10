class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :twitter_screen_name, :string
  end
end
