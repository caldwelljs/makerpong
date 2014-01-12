 class Game < ActiveRecord::Base

  belongs_to :player
  belongs_to :opponent, :class_name => "Player"

  def winning_player
    Player.find(self.winner).email
  end

  def logresults
    if self.player_score > self.opponent_score 
      self.player.wins += 1
      self.opponent.losses += 1
      self.player.save
      self.opponent.save
    else
      self.opponent.wins += 1
      self.player.losses += 1
      self.player.save
      self.opponent.save
    end
  end


end