class GraphController < ApplicationController
  def index
    @a = 395

    @battery = Battery.pluck(:wat)
    @power = Power.pluck(:wat)
  end

  def add 
    Power.create(:wat => 100)
    Battery.create(:wat => 100)

    @battery = Battery.pluck(:wat)
    @power = Power.pluck(:wat)

  end

end
