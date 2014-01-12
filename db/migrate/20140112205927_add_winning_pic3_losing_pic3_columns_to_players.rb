class AddWinningPic3LosingPic3ColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :winning_pic3, :string
    add_column :players, :losing_pic3, :string
  end
end
