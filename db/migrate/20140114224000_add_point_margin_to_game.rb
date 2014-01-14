class AddPointMarginToGame < ActiveRecord::Migration
  def change
    add_column :games, :point_margin, :integer
  end
end
