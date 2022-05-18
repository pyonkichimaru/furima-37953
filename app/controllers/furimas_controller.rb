class FurimasController < ApplicationController

  def index
  end
  
  def new
    @furima=Furima.new
  end

  def create
    @furima = Furima.new
  end

end
