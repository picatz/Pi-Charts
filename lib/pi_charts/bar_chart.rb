module PiCharts

  class Bar < Base

    def add_labels(labels)
      @config.data[:data][:labels] = labels
    end

    def title(args={})
      if args.keys.empty? or ! args.keys.include? [:title]
        raise "need to specify title with {title: 'name', display: true/false }" 
      end
      @config.data[:data][:options][:title] = {}
      @config.data[:data][:options][:title][:text] = args[:title] || ""
      @config.data[:data][:options][:title][:display] = true unless args[:display] == false
      true
    end

    def create(args={})
      @config.data[:type] = 'bar'
      @config.data[:data][:datasets] = []
      @config.data[:data][:labels]   = []
      true
    end

    def stack(args={})
      @config.data[:options][:scales]         = {} unless @config.data[:options][:scales]
      @config.data[:options][:scales][:xAxes] = [] unless @config.data[:options][:scales][:xAxes] 
      @config.data[:options][:scales][:yAxes] = [] unless @config.data[:options][:scales][:yAxes]
      if args.keys.empty?
        @config.data[:options][:scales][:xAxes] << { stacked: true } 
        @config.data[:options][:scales][:yAxes] << { stacked: true }
      else
        @config.data[:options][:scales][:xAxes] << { stacked: true } if args[:x]
        @config.data[:options][:scales][:yAxes] << { stacked: true } if args[:y]
      end
    end

    def add_dataset(args={})
      if args.keys.empty?
        raise "need to specify dataset"
      end
      label = args[:label]
      data  = args[:data]
      color = args[:color] || random_color
      index = dataset_index(label)
      if index
        if data.kind_of?(Array)
          data.each { |d| @config.data[:data][:datasets][index][:data] << d }
        else
          @config.data[:data][:datasets][index][:data] << data
        end
      else
        dataset = {}
        dataset[:label] = label
        dataset[:borderColor] = color 
        dataset[:backgroundColor] = color 
        dataset[:data]  = []
        if data.kind_of?(Array)
          data.each { |d| dataset[:data] << d }
        else
          dataset[:data] << data
        end
        @config.data[:data][:datasets] << dataset
      end 
      true
    end

    def border(args={}) 
      if args.keys.empty?
        false
      else
        if args[:dataset]
          index = dataset_index(args[:dataset])
          if index
            @config.data[:data][:datasets][index][:borderColor]   = args[:color]   if args[:color]
            @config.data[:data][:datasets][index][:borderWidth]   = args[:width]   if args[:width]
            @config.data[:data][:datasets][index][:borderSkipped] = args[:skipped] if args[:skipped]
            @config.data[:data][:datasets][index][:borderDash]    = args[:dash]    if args[:dash]
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    def hover(args={}) 
      if args.keys.empty?
        false
      else
        if args[:dataset]
          index = dataset_index(args[:dataset])
          if index
            @config.data[:data][:datasets][index][:hoverBackgroundColor] = args[:color]  if args[:color]
            @config.data[:data][:datasets][index][:hoverBorderColor]     = args[:border] if args[:border]
            @config.data[:data][:datasets][index][:hoverBorderWidth]     = args[:width]  if args[:width]
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    private

    def dataset_index(label=false)
      if label
        @config.data[:data][:datasets].each_with_index do |set, index|
          if set[:label] == label
            return index
          end
        end
      end
      false
    end


  end


end
