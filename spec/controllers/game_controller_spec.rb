require 'spec_helper'
require 'tictactien-gem'

describe GameController do
  describe "index" do
    it "renders the index page" do
      get :index
      response.should render_template("index")
    end
          
    it "chooses player one to be human" do
      params = {:player_one => 'Human', :player_two => 'Human'}
      game = mock('game')
      Tictactien.stub!(:new_game).and_return(game)

      game.should_receive(:choose_player_one).with(params[:player_one])
      game.stub!(:choose_player_two)

      game.stub!(:start)
            
      post :index, params
    end
    
    it "chooses player two to be human" do
      params = {:player_one => 'Human', :player_two => 'Human'}
      game = mock('game')
      Tictactien.stub!(:new_game).and_return(game)
      
      game.stub!(:choose_player_one)
      game.should_receive(:choose_player_two).with(params[:player_two])

      game.stub!(:start)
            
      post :index, params
    end
    
    it "chooses player one to be a random cpu" do
      params = {:player_one => 'RandomCPU', :player_two => 'PerfectCPU'}
      game = mock('game')
      Tictactien.stub!(:new_game).and_return(game)
      
      game.should_receive(:choose_player_one).with(params[:player_one])
      game.stub!(:choose_player_two)

      game.stub!(:start)
            
      post :index, params
    end
    
    it "chooses player two to be a perfect cpu" do
      params = {:player_one => 'RandomCPU', :player_two => 'PerfectCPU'}
      game = mock('game')
      Tictactien.stub!(:new_game).and_return(game)
      
      game.stub!(:choose_player_one)
      game.should_receive(:choose_player_two).with(params[:player_two])
      
      game.stub!(:start)
      
      post :index, params
    end
    
    it "starts a game" do
      game = mock('game')
      Tictactien.stub!(:new_game).and_return(game)
      
      game.stub!(:choose_player_one)
      game.stub!(:choose_player_two)
      
      game.should_receive(:start)
      
      post :index
    end
    
    it "should not start a game if one already exists" do
      game = mock('game')
      assigns[:game] = game
      Tictactien.should_not_receive(:new_game).and_return(game)
      
      post :index
    end
  end
end
