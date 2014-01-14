class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])  
  end

  def new
    @game = Game.new
  end

  def create
   @game = Game.new(game_params)
     if @game.save
       @game.logresults
       @game.streak
       @game.margin
       redirect_to @game
     else
       render 'new'
     end
  end

  def edit
    @game = Game.find_by(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to root_path
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destory
    flash[:notice] = "Consider this game destroyed."
    redirect_to root_path
  end


  private
  def game_params
    params.require(:game).permit(:player_id, :opponent_id, :player_score, :opponent_score)
  end
end
