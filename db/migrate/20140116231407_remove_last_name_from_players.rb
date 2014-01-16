class RemoveLastNameFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :last_name, :string
  end
end
