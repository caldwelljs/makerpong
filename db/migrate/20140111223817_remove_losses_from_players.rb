class RemoveLossesFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :losses, :integer
  end
end
