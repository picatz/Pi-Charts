module PiCharts

  class Pie < Base

    def label(label)
      @config.data[:data][:label] = label 
      true
    end

    def create(args={})
      @config.data[:type] = 'pie'
      @config.data[:data][:datasets] = []
      label = args[:label] || ""
      data  = args[:data]  || []
      color = args[:color] || []
      data  = { data: data, backgroundColor: color, label: label }
      @config.data[:data][:datasets] << data
      @config.data[:data][:labels] = []
      true
    end

    def add_dataset(args={})
      label = args[:label]
      data  = args[:data]
      color = args[:color] || random_color
      if @config.data[:data][:labels].include? label
        index = @config.data[:data][:labels].index(label)
        if args[:add]
          @config.data[:data][:datasets].first[:data][index] += data
        else
          @config.data[:data][:datasets].first[:data][index] = data
        end
      else
        @config.data[:data][:datasets].first[:data] << data
        @config.data[:data][:datasets].first[:backgroundColor] << color
        @config.data[:data][:labels] << label 
      end
      true
    end

    def animate(animate=true)
      if animate
        @config.data[:options] = true
      else
        @config.data[:options] = false
      end
    end


  end

end
