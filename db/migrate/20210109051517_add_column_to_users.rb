class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :twitter_id, :string
  end
end
