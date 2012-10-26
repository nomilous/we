module We

  class << self

    def type( args )

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

      @data.merge!( data ) do |key, old, new|

        #
        # on overwrite: 
        # 
        #    old and new
        #    yield into here 
        #

      end

    end

  end

end
