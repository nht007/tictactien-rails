class GameController < ApplicationController
  respond_to :html

  def index
    if @game
      
    else
      @game = Tictactien.new_game
      @game.choose_player_one(params[:player_one])
      @game.choose_player_two(params[:player_two])
      
      game_state = @game.start
    end
    
    respond_to do |format|
      format.html
    end
  end
end
