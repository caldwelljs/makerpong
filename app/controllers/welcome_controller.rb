class WelcomeController < ApplicationController
 before_filter :authenticate_player!, except: [:index, :about]

  def index
  end

  def dashboard
    @players = Player.all
    @games = Game.all 
    @game = Game.new # for the new game form
    @player = @games.last.player
    @opponent = @games.last.opponent
    @player_losing_pictures = [@games.last.player.losing_pic1, @games.last.player.losing_pic2, @games.last.player.losing_pic3].sample
    @player_wining_pictures = [@games.last.player.winning_pic1, @games.last.player.winning_pic2, @games.last.player.winning_pic3].sample
    @player_lose_picture =  if @player_losing_pictures.blank?
                              @player.picture_url
                            else  
                              @player_losing_pictures
                            end
    @player_win_picture = if @player_wining_pictures.blank?
                              @player.picture_url
                          else  
                             @player_wining_pictures
                          end
    @opponent_losing_pictures = [@games.last.opponent.losing_pic1, @games.last.opponent.losing_pic2, @games.last.opponent.losing_pic3].sample
    @opponent_wining_pictures = [@games.last.opponent.winning_pic1, @games.last.opponent.winning_pic2, @games.last.opponent.winning_pic3].sample
    @opponent_lose_picture =  if @opponent_losing_pictures.blank?
                                @opponent.picture_url
                              else  
                                @opponent_losing_pictures
                              end
    @opponent_win_picture = if @opponent_wining_pictures.blank?
                              @opponent.picture_url
                            else  
                              @opponent_wining_pictures
                            end
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
