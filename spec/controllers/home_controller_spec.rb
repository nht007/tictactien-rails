require 'spec_helper'

describe HomeController do
  describe "index" do
    it "renders the index page" do
      get :index
      response.should render_template("index")
    end
  end
end
