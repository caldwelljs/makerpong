class GamesController < ApplicationController

  def create
   @game = current_player.games.build(:opponent_id => params[:opponent_id])
   if @game.save
     flash[:notice] = "Game successfully created."
     redirect_to root_url
   else
     flash[:error] = "Unable to create game."
     redirect_to root_url
   end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destory
    flash[:notice] = "Consider this game destroyed."
    redirect_to root_url
  end
end
