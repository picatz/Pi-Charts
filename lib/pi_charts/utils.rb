module PiCharts

  class Utils

    def cdn(args={})
      version = args[:version] || "2.4.0"
      min     = false          || args[:min]
      if min
        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/#{version}/Chart.min.js\"></script>"
      else
        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/#{version}/Chart.js\"></script>"
      end
    end

    def random_color
      "##{SecureRandom.hex(3)}"
    end

  end

end
