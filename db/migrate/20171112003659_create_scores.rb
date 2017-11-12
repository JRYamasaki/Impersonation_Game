class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.string :username
      t.integer :wins
      t.integer :correctGuess
      t.integer :incorrectGuess

      t.timestamps
    end
  end
end
