class GamesController < ApplicationController
  before_filter :authenticate_player!

  def index
    @games = Game.all
    @game = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def live_score
    @game = Game.new
  end

  def new
    @game = Game.new
  end

  def create
   @game = Game.new(game_params)
     if @game.save
       redirect_to welcome_dashboard_path
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
