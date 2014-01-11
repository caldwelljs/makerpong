class PagesController < ApplicationController
  def dashboard 
    @players = Player.all
    @games = Game.all
  end
end