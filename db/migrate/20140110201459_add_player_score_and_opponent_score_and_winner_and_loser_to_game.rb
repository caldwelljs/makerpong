class AddPlayerScoreAndOpponentScoreAndWinnerAndLoserToGame < ActiveRecord::Migration
  def change
    add_column :games, :player_score, :integer
    add_column :games, :opponent_score, :integer
    add_column :games, :winner, :integer
    add_column :games, :loser, :integer
  end
end
