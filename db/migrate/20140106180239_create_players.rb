class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :picture_url
      t.string :phone
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
