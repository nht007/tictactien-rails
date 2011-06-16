require 'spec_helper'
require 'tictactien-gem'

describe HomeController do
  describe "index" do
    it "renders the index page" do
      get :index
      response.should render_template("index")
    end

    it "assigns a board without input" do
      grid = [[nil, nil, nil],
              [nil, nil, nil],
              [nil, nil, nil]]
      
      player = mock('player')
      game_state = mock('game_state')
      board = mock('board', :grid => grid)
      
      Tictactien.should_receive(:create_player).and_return(player)
      Tictactien.should_receive(:create_new_game).with(player).and_return(game_state)
      game_state.should_receive(:board).and_return(board)
      board.should_receive(:grid).and_return(grid)
      
      post :index
      
      assigns(:board).should == grid
    end
    
    # it "assigns a board with input" do
    #   post :index, {:board_input => 'x'}
    #   assigns(:board).should == "x"
    # end
    # 
    # it "" do
    #   
    # end
  end
end
