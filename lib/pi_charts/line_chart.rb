module PiCharts

  class Line < Base

    def add_labels(labels)
      @config.data[:data][:labels] = labels
    end

    def title(args = {})
      if args.keys.empty? or ! args.keys.include? [:title]
        raise "need to specify title with {title: 'name', display: true/false }" 
      end
      @config.data[:data][:options][:title] = {}
      @config.data[:data][:options][:title][:text]    = args[:title] || ""
      @config.data[:data][:options][:title][:display] = true unless args[:display] == false
      true
    end

    def create(args = {})
      @config.data[:type] = 'line'
      @config.data[:data][:datasets] = []
      @config.data[:data][:labels]   = []
      @config.data[:data][:options]  = []
      true
    end

    def add_dataset(args = {})
      if args.keys.empty?
        raise "need to specify dataset with { label: 'name', data: [1,2,3] }"
      end
      label = args[:label]
      data  = args[:data]
      color = args[:color] || random_color
      fill  = args[:fill]  || false
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
        dataset[:fill]  = fill
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

    def tension(args={})
      if args.keys.empty?
        false
      else
        if args[:dataset]
          index = dataset_index(args[:dataset])
          if index
            @config.data[:data][:datasets][index][:lineTension] = args[:ammount]
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    def border(args={}) 
      if args.keys.empty?
        false
      else
        if args[:dataset]
          index = dataset_index(args[:dataset])
          if index
            @config.data[:data][:datasets][index][:borderColor]      = args[:color]        if args[:color]
            @config.data[:data][:datasets][index][:borderWidth]      = args[:width]        if args[:width]
            @config.data[:data][:datasets][index][:borderCapStyle]   = args[:cap]          if args[:cap]
            @config.data[:data][:datasets][index][:borderDash]       = args[:dash]         if args[:dash]
            @config.data[:data][:datasets][index][:borderDashOffset] = args[:dash_offeset] if args[:dash_offset]
            @config.data[:data][:datasets][index][:borderJoinStyle]  = args[:joint]        if args[:joint]
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    def point(args={}) 
      if args.keys.empty?
        false
      else
        if args[:dataset]
          index = dataset_index(args[:dataset])
          if index
            @config.data[:data][:datasets][index][:pointBorderColor]           = args[:color]  if args[:color]
            @config.data[:data][:datasets][index][:pointBorderBackgroundColor] = args[:border] if args[:border]
            @config.data[:data][:datasets][index][:pointBorderWidth]           = args[:width]  if args[:width]
            @config.data[:data][:datasets][index][:pointRadius]                = args[:radius] if args[:radius]
            @config.data[:data][:datasets][index][:pointHoverRadius]           = args[:hover]  if args[:hover]
            @config.data[:data][:datasets][index][:pointHitRadius]             = args[:hit]    if args[:hit]
            @config.data[:data][:datasets][index][:pointStyle]                 = args[:style]  if args[:style]
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    def no_line(dataset=false)
      unless dataset
        false
      else
        if dataset
          index = dataset_index(dataset)
          if index
            @config.data[:data][:datasets][index][:showLine] = false
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    def span_gaps(dataset=false)
      unless dataset
        false
      else
        if dataset
          index = dataset_index(dataset)
          if index
            @config.data[:data][:datasets][index][:spanGaps] = true 
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    def stepped(dataset = false)
      unless dataset
        false
      else
        if dataset
          index = dataset_index(dataset)
          if index
            @config.data[:data][:datasets][index][:steppedLine] = true 
          else
            raise "dataset doesn't seem to exist"
          end    
        else
          raise "need to specify a dataset"
        end
      end
    end

    private

    def dataset_index(label = false)
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
