module PlayersHelper
  def streak_display(player)
    if player.win_streak > 0
      "Won #{player.win_streak}"
    else
      "Lost #{player.lose_streak}"
    end
  end
end
