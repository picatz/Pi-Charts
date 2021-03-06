module PiCharts
  
  # The Config class provides the interface to the config
  # for a chart. This is basically the skeleton of the 
  # infromation that drives the infromation for the chart
  # that can be rendered into json. This information is 
  # constructed with its +data+ which actually provides
  # the blueprints.
  class Config
    attr_accessor :data # The main brain and butter of what makes the co

    # The initialize() method handles the creation of what defines
    # the +data+ for a +config+, which sets up the relevant base.
    def initialize(args={})
      @data = {}
      @data[:type] = ''
      @data[:data] = {}
      @data[:data][:datasets] = []
      @data[:options] = {}
    end 
    
    # type?() helps determine if a type has been set or not. 
    def type?
      @data[:type].empty? ? false : true
    end
    
    # type() returns the the type set in the config, or false
    # if a type has not yet been set.
    def type
      @data[:type].empty? ? false : @data[:type]
    end

    # json() returns the +json+ representation of the +config+ data
    # in a javascript friendly form. Magic!
    def json
      @data.to_json
    end

  end
end
