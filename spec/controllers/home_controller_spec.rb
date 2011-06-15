require 'spec_helper'

describe HomeController do
  describe "index" do
    it "renders the index page" do
      get :index
      response.should render_template("index")
    end

    it "assigns a board without input" do
      post :index
      assigns(:board).should == ""
    end
    
    it "assigns a board with input" do
      post :index, {:board_input => 'x'}
      assigns(:board).should == "x"
    end
  end
end