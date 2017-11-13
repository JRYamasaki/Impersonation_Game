class CreateLobbies < ActiveRecord::Migration[5.1]
  def change
    create_table :lobbies do |t|
      t.string :title
      t.integer :spotsLeft
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
