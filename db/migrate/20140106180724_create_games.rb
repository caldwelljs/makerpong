class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_id
      t.integer :opponent_id

      t.timestamps
    end
  end
end
