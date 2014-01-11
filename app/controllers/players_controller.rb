class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    # If you want to store who created this player, write @player.user_id = current_user.id
    if @player.save
      redirect_to @player
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    redirect_to root_path
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to root_path
  end

  def player_params
    params.require(:player).permit(:name, :picture_url, :player_id)
  end
end
