module We

  class Node

    attr_reader :data
    #attr_reader :edge

    def initialize

      @data = {}
      #@edge = []

    end

    def store( data )

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
