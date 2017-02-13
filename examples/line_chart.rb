$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "pi_charts"

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
puts chart.html
