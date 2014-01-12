class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @games = Game.all
    rankings = Player.power_ranking
    @rank = rankings.find_index(@player) + 1
    @recent_games = Game.get_all_recent_games_for(current_player)
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
    redirect_to @player
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to root_path
  end


  def player_params
    params.require(:player).permit(:name, :picture_url, :player_id, :winning_pic1, :winning_pic2, :losing_pic1, :losing_pic2 )
  end
end
