# Pi Charts

Pi Charts is a ruby gem to easily generate beautiful charts using [chartjs](http://www.chartjs.org/docs) 📈◕📊◔📉🍩 

⚠️ This gem is install in development. Things may change to be better in the future. 

## Usage

Pi Charts is a really good pair with something like [sinatra](http://www.sinatrarb.com/), for example:

```ruby
require 'sinatra'
require 'pi_charts'

def bake_pie
  chart = PiCharts::Pie.new
  chart.add_dataset(label: "cats", data: 80)
  chart.add_dataset(label: "dogs", data: 50)
  chart.hover
  chart.responsive
  "<head>" + chart.cdn + "</head>" + "<body>" + chart.html(width: 60) + "</body>"
end

get('/serve_pie') { bake_pie }
```
## Screen Shots

![fresh pie](http://i.imgur.com/6rjzOnT.png)

![bar](http://i.imgur.com/h0afu2c.png)

![line](http://i.imgur.com/xBPZPae.png)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Author

Kent 'picat' Gruber
