class RemoveLoserFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :loser, :integer
  end
end
