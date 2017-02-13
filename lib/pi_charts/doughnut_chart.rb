module PiCharts

  class Doughnut < Pie
    def create!(args={})
      @config.data[:type] = 'doughnut'
      @config.data[:data][:datasets] = []
      label = args[:label] || ""
      data  = args[:data]  || []
      color = args[:color] || []
      data  = { data: data, backgroundColor: color, label: label }
      @config.data[:data][:datasets] << data
      @config.data[:options][:cutoutpercentage] = 50
      @config.data[:data][:labels] = []
      true
    end
    
    def cutout(percentage=false)
      if percentage
        @config.data[:options][:cutoutpercentage] = percentage
        true
      else
        @config.data[:options][:cutoutPercentage]
      end
    end
  end

end
