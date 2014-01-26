class AddWinPercentageToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :win_percentage, :decimal, :precision => 4, :scale => 4, :default => 0
  end
end
