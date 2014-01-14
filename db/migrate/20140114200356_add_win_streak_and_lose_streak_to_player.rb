class AddWinStreakAndLoseStreakToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :win_streak, :integer
    add_column :players, :lose_streak, :integer
  end
end
