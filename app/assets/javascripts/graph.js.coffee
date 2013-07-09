# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  chart = new Highcharts.Chart(
    chart:
      renderTo: "graph"
      defaultSeriesType: "spline"
      marginRight: 10
      events:
        load: ->
          power = @series[0]
          battery = @series[1]
          setInterval (->
            $.ajax
              url: "/refresh"
              type: "GET"
              dataType: "json"
              success: (data) ->
                x = (new Date()).getTime()
                p = parseFloat data.power
                b = parseFloat data.battery
                power.addPoint [x, p], true, true
                battery.addPoint [x, b], true, true
          ), 1000

    title:
      text: "Live Data"
      style:
        margin: "10px 100px 0 0"

    xAxis:
      type: "datetime"
      tickPixelInterval: 150

    yAxis:
      title:
        text: "Value"

      plotLines: [
        value: 0
        width: 1
        color: "#808080"
      ]

    tooltip:
      formatter: ->
        "<b>" + @series.name + "</b><br/>" + Highcharts.dateFormat("%Y-%m-%d %H:%M:%S", @x) + "<br/>" + Highcharts.numberFormat(@y, 2)

    legend:
      enabled: false

    exporting:
      enabled: false

    plotOptions:
      spline:
        dataLabels:
          enabled: true
          formatter: ->
            @series.inc = 1  unless @series.inc
            if @series.inc >= parseInt(@series.data.length)
              @series.inc = 0
              return @point.y
            @series.inc++

    series: [
      name: "Power"
      data: (->
        data = []
        time = (new Date()).getTime()
        i = -30
        while i <= 0
          data.push
            x: time + i * 1000
            y: 0 

          i++
        data
      )()
    ,
      name: "Battery"
      data: (->
        data = []
        time = (new Date()).getTime()
        i = -30
        while i <= 0
          data.push
            x: time + i * 1000
            y: 0 

          i++
        data
      )()
    ]
  )


