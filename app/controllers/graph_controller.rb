class GraphController < ApplicationController
  def index
    @battery = Battery.pluck(:watt)
    @power = Power.pluck(:watt)
  end

  def add
    Power.create(:watt => params[:power])
    Battery.create(:watt => params[:battery])
  end

  def refresh    
    if params[:id] == 'power'
      @power = Power.last
      render :text => @power.watt
    elsif params[:id] == 'battery'     
      @battery = Battery.last
      render :text => @battery.watt
    end
  end

end
