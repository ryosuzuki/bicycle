class GraphController < ApplicationController
  def index
    @battery = Battery.pluck(:watt)
    @power = Power.pluck(:watt)
  end

  def add
    Power.create(:watt => params[:power])
    Battery.create(:watt => params[:battery])
    
    @power = Power.last
    @battery = Battery.last

    Pusher['test_channel'].trigger('greet', { :greeting => "Hello there!" })

#    response = Pusher[params[:channel_name]].authenticate(params[:socket_id])
#    render :json => response

#    Pusher["channel"].trigger("event", params[:power] + "<br />")
#    render :text => "success"
  end

end
