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
   # If you want to store who created this game, write @game.user_id = current_user.id
   # if player = true && opponent = true
     if @game.save
       redirect_to @game
     else
       render 'new'
     end
  # else
  #   flash[:notice] = "These are not existing players."
  #   render 'new'
  # end

   # @game = games.build(:opponent_id => params[:opponent_id])
   # if @game.save
   #   flash[:notice] = "Game successfully created."
   #   redirect_to root_path
   # else
   #   flash[:error] = "Unable to create game."
   #   redirect_to root_path
   # end
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
