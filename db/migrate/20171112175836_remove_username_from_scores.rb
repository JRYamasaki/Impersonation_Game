class RemoveUsernameFromScores < ActiveRecord::Migration[5.1]
  def change
    remove_column :scores, :username, :string
  end
end
