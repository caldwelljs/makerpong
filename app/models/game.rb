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
      self.winner = player.id
      self.save
      self.player.save
      self.opponent.save
    else
      self.opponent.wins += 1
      self.player.losses += 1
      self.winner = opponent.id
      self.save
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

  def self.get_all_recent_games_for(player)
    # results = []
    player_game = Game.where("player_id = #{player.id} or opponent_id = #{player.id}").all
    results = player_game.sort{ |x,y| y <=> x }.first(10)
    results
  end

end


#   # results = []
  #   # player_games = Game.where(:player_id => player.id).all
  #   # player_games << Game.where(:opponent_id => player.id).all
  #   # results << player_gamesplayer_games.sort{ |x,y| y <=> x }.first(10)
  #   # results