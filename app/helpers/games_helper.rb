module GamesHelper
  def worst_loss_display
    if Game.all.empty?
    	"Player 1" 
    elsif	Game.worst_loss.first.point_margin > 0
      "#{Game.worst_loss.first.opponent.name} by #{Game.worst_loss.first.point_margin}"
    elsif Game.worst_loss.first.point_margin < 0
      "#{Game.worst_loss.first.player.name} by #{Game.worst_loss.first.point_margin}"
    end
  end

  def worst_loss_display_pic
    if Game.all.empty?
      "Player 1" 
    elsif Game.worst_loss.first.point_margin > 0
      Game.worst_loss.first.opponent.picture_url
    elsif Game.worst_loss.first.point_margin < 0
      Game.worst_loss.first.player.picture_url
    end
  end
end
