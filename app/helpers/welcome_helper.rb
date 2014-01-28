module WelcomeHelper
	def check_games_played
	  if @player.games.empty?
	    "No Games Played"
	  else
	    "Run Code"
	  end
	end

  def biggest_loser
    Player.where('wins > ? or losses > ?', 0, 0).sort {|a, b| b.win_percentage <=> a.win_percentage}.last
  end 
end
