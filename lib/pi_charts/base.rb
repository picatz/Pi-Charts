module PiCharts
  # The Base class is responsible for providing the boiler plate
  # code for all of the different types of +PiCharts+ that someone
  # can create with this gem. That's its job.
  class Base
    attr_accessor :config # Configuration base for all charts.
    attr_accessor :cdn    # Content distribution network, for the lulz.

    # Every class has a +config+ and, depending on the type
    # the +create+ method will help with setting up the +config+
    # for that specific type of chart. 
    def initialize(args = {})
      @config = Config.new
      create
    end

    # The responsive() method will make any chart responsive.
    def responsive(responsive = true)
      if responsive
        config.data[:options][:responsive] = true
      else
        config.data[:options][:responsive] = false
      end
    end

    # The cdn() method will generate a bit of html magic to create
    # a cloudflare cdn link for the needed javascript.
    def cdn(args = {})
      version = args[:version] || '2.4.0'
      min     = false          || args[:min]
      if min
        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/#{version}/Chart.min.js\"></script>"
      else
        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/#{version}/Chart.js\"></script>"
      end
    end

    # The legend() provides an interface to set options for the legend for any chart. 
    def legend(args = {})
      config.data[:options][:legend] = {} unless config.data[:options][:legend]
      config.data[:options][:legend][:position]  = args[:position] if args [:position]
      config.data[:options][:legend][:display]   = true  if args[:display]
      config.data[:options][:legend][:display]   = false if args[:hidden]
      config.data[:options][:legend][:fullWidth] = true  if args[:full]
      config.data[:options][:legend][:reverse]   = true  if args[:reverse]
      # legend labels
      config.data[:options][:legend][:labels][:boxWidth]  = args[:width]   if args[:width]
      config.data[:options][:legend][:labels][:fontSize]  = args[:size]    if args[:size]
      config.data[:options][:legend][:labels][:fontStyle] = args[:style]   if args[:style]
      config.data[:options][:legend][:labels][:padding]   = args[:padding] if args[:padding]
    end

    # The hover() method provides an interface +that is currently incomplete+ to the hover options for a chart.
    def hover(args = {})
      config.data[:options][:hover] = {}
      if args.keys.empty?
        config.data[:options][:hover][:mode] = 'nearest'
        config.data[:options][:hover][:intersect] = true
      else
        config.data[:options][:hover][:mode] = 'nearest' if args[:nearest]
        config.data[:options][:hover][:intersect] = true if args[:intersect]
        config.data[:options][:hover][:animationDuration] = args[:animation] if args[:animation]
      end
      # TODO: add support for onHover configuration option
      true
    end

    # Sometimes you just need a random color.
    def random_color
      "##{SecureRandom.hex(3)}"
    end

    # The create() method helps with the main boiler-plate
    # buisness that goes behind the Base class.
    def create
      # helps with boilerplateness
    end

    # The html() method helps build the relevant html for the chart.
    def html(args = {})
      id     = SecureRandom.uuid
      width  = args[:width]  || "50"
      config = args[:config] || @config.json
      type   = @config.type

      "<div id=\"canvas-holder\" style=\"width:#{width}%\">
        <canvas id=\"#{id}\" />
      </div>
      <script>
        var config = #{config}
        window.onload = function() {
          var ctx = document.getElementById(\"#{id}\").getContext(\"2d\");
          new Chart(ctx, config);
        };
      </script>" 
    end 
  end
end
