module WelcomeHelper
	def check_games_played
	  if @player.games.empty?
	    "No Games Played"
	  else
	    "Run Code"
	  end
	end
end
