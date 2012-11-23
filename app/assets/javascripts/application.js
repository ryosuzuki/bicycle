// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


var chart = new Highcharts.Chart({
  chart: {
    renderTo: 'container',
    defaultSeriesType: 'spline',
    marginRight: 10,
    events: {
      load: function() {
        var series = this.series[0];
        setInterval(function() {
          var x = (new Date()).getTime(),
          y = Math.random();
          series.addPoint([x, y], true, true);
        }, 1000);
      }
    }
  },
  title: {
    text: 'Live random data',
    style: {
      margin: '10px 100px 0 0'
    }
  },
  xAxis: {
    type: 'datetime',
    tickPixelInterval: 150
  },
  yAxis: {
    title: {
      text: 'Value'
    },
    plotLines: [{
      value: 0,
      width: 1,
      color: '#808080'}]
  },
  tooltip: {
    formatter: function() {
      return '<b>' + this.series.name + '</b><br/>' + Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' + Highcharts.numberFormat(this.y, 2);
    }
  },
  legend: {
    enabled: false
  },
  exporting: {
    enabled: false
  },
  plotOptions: {
    spline: {
      dataLabels: {
        enabled: true,
        formatter: function() {
          if (!this.series.inc) this.series.inc = 1;
          if (this.series.inc >= parseInt(this.series.data.length)) {
            this.series.inc = 0;
            return this.point.y;
          }
          this.series.inc++;
        }
      }
    }
  },
  series: [{
    name: 'Random data',
    data: (function() {
      var data = [],
      time = (new Date()).getTime(),
      i;
      for (i = -19; i <= 0; i++) {
        data.push({
          x: time + i * 1000,
          y: Math.random()
        });
      }
      return data;
    })()
  }]
});​
