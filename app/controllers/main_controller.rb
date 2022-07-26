class MainController < ApplicationController
  def index
    flash[:notice] = 'This is a flash!'
  end
end
