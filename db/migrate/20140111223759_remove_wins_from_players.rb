class RemoveWinsFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :wins, :integer
  end
end
