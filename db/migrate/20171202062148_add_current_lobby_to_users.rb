class AddCurrentLobbyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_lobby, :integer
  end
end
