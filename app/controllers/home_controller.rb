class HomeController < ApplicationController
  respond_to :html

  def index
    @board = ""
    
    if (params[:board_input])
      @board = params[:board_input]
    end
    
    respond_to do |format|
      format.html
    end
  end
end
