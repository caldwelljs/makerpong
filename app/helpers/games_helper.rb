module GamesHelper
  def worst_loss_display
    if Game.all.empty?
    	"Player 1" 
    elsif	Game.worst_loss.first.point_margin > 0
      "#{Game.worst_loss.first.opponent.name} by #{Game.worst_loss.first.point_margin} points"
    elsif Game.worst_loss.first.point_margin < 0
      "#{Game.worst_loss.first.player.name} by #{Game.worst_loss.first.point_margin} points"
    end
  end
end
