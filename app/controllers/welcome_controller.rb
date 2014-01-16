class WelcomeController < ApplicationController
 before_filter :authenticate_player!, except: [:index]

  def index
  end

  def dashboard
    @players = Player.all
    @games = Game.all 
  end
end
