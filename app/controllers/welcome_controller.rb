class WelcomeController < ApplicationController
 before_filter :authenticate_player!, except: [:index]

  def index
  end

  def dashboard
    @players = Player.all
    @games = Game.all 
    @game = Game.new() # for the new game form
  end
end
