class HomeController < ApplicationController
  respond_to :html

  def index
    player = Tictactien.create_player(Tictactien::HUMAN, 'x')
    game_state = Tictactien.create_new_game(player)
    
    @board = game_state.board.grid
        
#    if (params[:board_input])
#      @board = params[:board_input]
#    end
    
    respond_to do |format|
      format.html
    end
  end
end
