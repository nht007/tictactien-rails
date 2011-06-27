require 'spec_helper'
require 'tictactien-gem'

describe GameController do
  before(:each) do
    login
  end
  
  context "starting a game" do
    before(:each) do
      @game = mock('game')
      Tictactien.stub!(:new_game).and_return(@game)

      @game.stub!(:choose_player_one)
      @game.stub!(:choose_player_two)

      @game.stub!(:start)
      
      @game.stub!(:active_player_class)
      @game.stub!(:print_board)
    end
    
    describe "index" do
      it "chooses player one to be human" do
        params = {"player_one" => 'Human', "player_two" => 'Human'}
        @game.should_receive(:choose_player_one).with(params["player_one"])
        
        post :index, params
      end
      
      it "chooses player two to be human" do
        params = {"player_one" => 'Human', "player_two" => 'Human'}
        @game.should_receive(:choose_player_two).with(params["player_two"])

        post :index, params
      end
      
      it "chooses player one to be a random cpu" do
        params = {"player_one" => 'RandomCPU', "player_two" => 'PerfectCPU'}
        @game.should_receive(:choose_player_one).with(params["player_one"])      
                    
        post :index, params
      end
      
      it "chooses player two to be a perfect cpu" do
        params = {"player_one" => 'RandomCPU', "player_two" => 'PerfectCPU'}
        @game.should_receive(:choose_player_two).with(params["player_two"])
              
        post :index, params
      end
      
      it "starts a game" do
        @game.should_receive(:start)
        
        post :index
      end
    
    end
    
    context "during a game" do
      before(:each) do
        game_record = mock('game_record')
        @game = mock('game')
        
        GameRecord.stub!(:find_by_id).and_return(game_record)
        game_record.stub!(:game_object).and_return(@game)
        
        @game.stub!(:check_win)
        @game.stub!(:update)
         
        Tictactien.stub!(:new_game).and_return(@game)

        game_record.stub!(:save)
              
        @game.stub!(:active_player_class)
        @game.stub!(:print_board)
        game_record.stub!(:id)
      end
      
      it "should not start a game if one already exists" do     
        Tictactien.should_not_receive(:new_game).and_return(@game)

        post :index
      end
      
      it "should update a game if one already exists" do
        params = {"game" => @game, "row" => "1", "column" => "1"}
        move = [params["row"].to_i-1, params["column"].to_i-1]
        
        @game.should_receive(:update).with(move)

        post :index, params
      end
      
      it "should not update the game if it is already done" do
        @game.should_receive(:check_win).and_return("win")
        params = {"game" => @game, "row" => "1", "column" => "1"}
        move = [params["row"].to_i-1, params["column"].to_i-1]
        
        @game.should_not_receive(:update).with(move)
        post :index, params  
      end
    end
  end
end
