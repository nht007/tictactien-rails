class GameController < ApplicationController
  before_filter :require_user
  respond_to :html

  def index
    game_record = GameRecord.find_by_id(params["game_id"])
    
    if game_record
      game = game_record.game_object
      winner = game.check_win
      
      if !winner
        move = [params["row"].to_i-1, params["column"].to_i-1]
        game.update(move)
      end
    else
      game_record = create_new_game_record
      game = game_record.game_object
    end
    
    game_record.save
    
    @player = game.active_player_class
    @winner = winner
    @board = game.print_board
    @game_id = game_record.id
    
    respond_to do |format|
      format.html
    end
  end
  
  private
  
  def create_new_game_record
    game = Tictactien.new_game
    game.choose_player_one(params["player_one"])
    game.choose_player_two(params["player_two"])
    
    game.start
    
    game_record = GameRecord.new
    game_record.game_object = game
    
    return game_record
  end
end
