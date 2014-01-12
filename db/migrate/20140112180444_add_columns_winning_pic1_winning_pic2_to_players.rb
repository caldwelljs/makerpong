class AddColumnsWinningPic1WinningPic2ToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :winning_pic1, :string
    add_column :players, :winning_pic2, :string
    add_column :players, :losing_pic1, :string
    add_column :players, :losing_pic2, :string
  end
end
