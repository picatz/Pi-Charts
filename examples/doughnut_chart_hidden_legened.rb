$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "pi_charts"

# create a new doughnut chart
chart = PiCharts::Doughnut.new

# add datasets
chart.add_dataset(label: "cats", data: 80)
chart.add_dataset(label: "dogs", data: 20)

# make cats 90
chart.add_dataset(label: "cats", data: 10, add: true)

# make dogs 10, not adding
chart.add_dataset(label: "dogs", data: 10)

# make the cutout 60 percent
chart.cutout(60)

# hide legend
chart.legend(hidden: true)

# neat 'lil configurations
chart.hover
chart.responsive

# generate html / js for chart
puts chart.html
