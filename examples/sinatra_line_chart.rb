$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pi_charts'
require 'sinatra'

# whatever sinatra configurations you want
set :bind, '0.0.0.0'
set :port, 4567

# create a new line chart
chart = PiCharts::Line.new

# add labels ( x values )
chart.add_labels(["January", "February", "March", "April", "May"])

# add datasets
chart.add_dataset(label: "cats", data: [3, 1, 3, 3, 7])
chart.add_dataset(label: "dogs", data: [7, 3, 3, 1, 3])

# neat 'lil configurations
chart.hover
chart.responsive

# generate html / js for chart
# and serve it up, on the house ( localhost )
get('/') { "<head>" + chart.cdn + "</head>" + "<body>" + chart.html(width: 100) + "</body>" }
