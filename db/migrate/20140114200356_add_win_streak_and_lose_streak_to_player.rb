class AddWinStreakAndLoseStreakToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :win_streak, :integer, :default => 0
    add_column :players, :lose_streak, :integer, :default => 0
  end
end
