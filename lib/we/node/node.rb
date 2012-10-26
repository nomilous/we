module We

  class << self

    def type( args )

      #
      # returns default or predefined Node types
      #

      unless args.is_a? Hash

        return We::Node

      end

      if defined[args.keys.first].nil?

        return We::Node

      end

      return defined[args.keys.first]

    end

  end

  class Node

    attr_reader :data
    #attr_reader :edge

    def initialize

      @data = {}
      #@edge = []

    end

    def inject( data )

      @data[:_type] = :node
      @data[:_class] = data.keys.first
      @data[:_tag] = data[data.keys.first]

      @data.merge!( data ) do |key, old, new|

        #
        # on overwrite: 
        # 
        #    old and new
        #    yield into here
        #

      end

      @data.delete data.keys.first

    end

  end

end
