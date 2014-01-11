 class Game < ActiveRecord::Base

  belongs_to :player
  belongs_to :opponent, :class_name => "Player"

  def winning_player
    Player.find(self.winner).email
  end
end