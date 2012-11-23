class GraphController < ApplicationController
  def index
    @battery = Battery.pluck(:watt)
    @power = Power.pluck(:watt)
  end

  def add
    if params[:power].present? && params[:battery].present?
      Power.create(:watt => params[:power])
      Battery.create(:watt => params[:battery])
    end
  end

end
