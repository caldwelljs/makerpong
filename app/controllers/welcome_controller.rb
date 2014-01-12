class WelcomeController < ApplicationController
  def index
  end

  def dashboard
    @players = Player.all
    @games = Game.all
  end


end
