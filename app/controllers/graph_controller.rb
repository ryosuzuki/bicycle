class GraphController < ApplicationController
  def index
    @a = 395

    @battery = Battery.pluck(:wat)
    @power = Power.pluck(:wat)
  end

  def add 
    Power.create(:wat => params[:power])
    Battery.create(:wat => params[:battery])
  end

end
