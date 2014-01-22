class WelcomeController < ApplicationController
 before_filter :authenticate_player!, except: [:index]

  def index
  end

  def dashboard
    @players = Player.all
    @games = Game.all 
  end

  def new
  	@game = Game.new
  end

  def create
   @game = Game.new(game_params)
     if @game.save
       redirect_to @game
     else
       render 'new'
     end
  end
  
end
