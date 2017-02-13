$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "pi_charts"

# create a new pie chart
chart = PiCharts::Pie.new

# add datasets
chart.add_dataset(label: "cats", data: 80)
chart.add_dataset(label: "dogs", data: 20)

# hide legend
chart.legend(hidden: true)

# neat 'lil configurations
chart.hover
chart.responsive

# generate html / js for chart
puts chart.html
