module PlayersHelper
  def streak_display(player)
    if player.win_streak > 0
      "Won #{player.win_streak}"
    else
      "Lost #{player.lose_streak}"
    end
  end

  def check_games_played
    if @player.games.empty?
      "No Games Played"
    else
      "Run Code"
    end
  end

  def player_opponent(game, player)
    if game.player.id == player.id 
      game.opponent
    else
      game.player
    end 
  end

  def player_opponent_pic(game, player)
    if game.player.id == player.id 
      game.opponent.picture_url
    else
      game.player.picture_url
    end 
  end

  def player_opponent_name(game, player)
    if game.player.id == player.id 
      game.opponent.name
    else
      game.player.name 
    end 
  end

  def player_score(game, player)
    if game.player.id == player.id 
      game.opponent_score
    else
      game.player_score
    end 
  end

  def player_opponent_score(game, player)
    if game.opponent.id == player.id 
      game.opponent_score
    else
      game.player_score
    end 
  end

  def game_winner_label(game, player)
    if game.winner == player.id
      content_tag(:div, "L", class: "loser")
    else
      content_tag(:div, "W", class: "winner")
    end
  end
end
