 class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :opponent, :class_name => "Player"

  validates :player_id, :opponent_id, :player_score, :opponent_score, presence: true
  validates :player_score, :opponent_score, numericality: true
  # validates_uniqueness_of :player_id != :opponent_id

  validate :fields_player_id_and_opponent_id_are_different

  def fields_player_id_and_opponent_id_are_different
    if self.player_id == self.opponent_id
      errors.add(:player, "must be different from Opponent. You don't honestly think I'd believe you played yourself!")
    end
  end

  after_create :logresults, :streak, :margin

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

  def win_percent
    @player_win_percentage ||= (self.player.wins.to_f / (self.player.wins + self.player.losses)).round(4)
    self.player.win_percent = @player_win_percentage    
    
    @opponent_win_percentage ||= (self.opponent.wins.to_f / (self.opponent.wins + self.opponent.losses)).round(4)
    self.opponent.win_percent = @opponent_win_percentage
  end

  def self.worst_loss
    self.all.sort {|a, b| b.point_margin.abs <=> a.point_margin.abs}
  end

  def self.get_all_recent_games_for(player)
    player_game = Game.where("player_id = #{player.id} or opponent_id = #{player.id}").all
    #results = player_game.sort{ |x,y| y 
    # results
  end

  def self.get_all_player_games(player)
    player_game = Game.where("player_id = #{player.id} or opponent_id = #{player.id}").all
    results = player_game.sort{ |x,y| y <=> x }
    results
  end

end
