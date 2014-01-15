module GamesHelper
  def worst_loss_display
    if Game.worst_loss.first.point_margin > 0
      "#{Game.worst_loss.first.opponent.name} by #{Game.worst_loss.first.point_margin} points"
    elsif Game.worst_loss.first.point_margin < 0
      "#{Game.worst_loss.first.player.name} by #{Game.worst_loss.first.point_margin} points"
    else
      "See the worst beating here"
    end
  end
end
