class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :lobby, foreign_key: true

      t.timestamps
    end
  end
end
