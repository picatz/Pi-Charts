$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pi_charts'
require 'sinatra'

# whatever sinatra configurations you want
set :bind, '0.0.0.0'
set :port, 4567

utils = PiCharts::Utils.new

get('/') { "try /line or /pie or /bar" }

def line
  chart = PiCharts::Line.new
  chart.add_labels(["January", "February", "March", "April", "May"])
  chart.add_dataset(label: "cats", data: [3, 1, 3, 3, 7])
  chart.add_dataset(label: "dogs", data: [7, 3, 3, 1, 3])
  chart.hover
  chart.responsive
  chart.html(width: 100)
end
get('/line') { "<head>" + utils.cdn + "</head>" + "<body>" + line + "</body>" }

def bake_pie
  chart = PiCharts::Pie.new
  chart.add_dataset(label: "cats", data: 80)
  chart.add_dataset(label: "dogs", data: 50)
  chart.hover
  chart.responsive
  chart.html(width: 100)
end
get('/pie') { "<head>" + utils.cdn + "</head>" + "<body>" + bake_pie + "</body>" }

def bar
  chart = PiCharts::Bar.new
  chart.add_labels(["January", "February", "March", "April", "May"])
  chart.add_dataset(label: "cats", data: [ 2, 0, 4, 7, 3 ])
  chart.add_dataset(label: "dogs", data: [ 4, 6, 3, 9, 2 ])
  chart.stack
  chart.hover
  chart.responsive
  chart.html(width: 100)
end
get('/bar') { "<head>" + utils.cdn + "</head>" + "<body>" + bar + "</body>" }

def get_doughnuts
  chart = PiCharts::Doughnut.new
  chart.add_dataset(label: "cats", data:  7)
  chart.add_dataset(label: "dogs", data: 13)
  chart.hover
  chart.responsive
  chart.html(width: 100)
end
get('/doughnut') { "<head>" + utils.cdn + "</head>" + "<body>" + get_doughnuts + "</body>" }

