 class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :opponent, :class_name => "Player"

  after_create :logresults, :streak, :margin

  def winning_player
    Player.find(self.winner).email
  end

  def logresults
    if self.player_score > self.opponent_score 
      self.player.wins += 1
      self.opponent.losses += 1
      self.update_columns(winner: player.id)
      self.player.save
      self.opponent.save
    else
      self.opponent.wins += 1
      self.player.losses += 1
      self.update_columns(winner: opponent.id)
      self.player.save
      self.opponent.save
    end
  end

  def streak
    if self.winner == player.id
      self.player.win_streak += 1
      self.player.lose_streak = 0
      self.opponent.win_streak = 0
      self.opponent.lose_streak += 1
      self.player.save
      self.opponent.save
    else  
      self.player.win_streak = 0
      self.player.lose_streak += 1
      self.opponent.win_streak += 1
      self.opponent.lose_streak = 0
      self.player.save
      self.opponent.save
    end
  end

  def margin
    margin_value = self.player_score - self.opponent_score
    self.update_columns(point_margin: margin_value) 
  end

  def self.worst_loss
    self.all.sort {|a, b| b.point_margin <=> a.point_margin}
  end

  def self.get_all_recent_games_for(player)
    player_game = Game.where("player_id = #{player.id} or opponent_id = #{player.id}").all
    results = player_game.sort{ |x,y| y <=> x }.first(10)
    results
  end

  def self.get_all_player_games(player)
    player_game = Game.where("player_id = #{player.id} or opponent_id = #{player.id}").all
    results = player_game.sort{ |x,y| y <=> x }
    results
  end

end
