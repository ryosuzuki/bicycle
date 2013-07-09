class GraphController < ApplicationController
  def index
    @battery = Battery.pluck(:watt)
    @power = Power.pluck(:watt)
  end

  def add
    Power.create(:watt => params[:power])
    Battery.create(:watt => params[:battery])
    
    render :text => 'ok'
  end

  def refresh
    @data = { :power => rand, :battery => rand }
    render :json => @data
  end

  private
  def battery_params
    params.require(:power).permit(:watt)
  end

  def power_params
    params.require(:power).permit(:watt)
  end

end
