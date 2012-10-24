module We

  class Node

    attr_reader :data

    def initialize

      @data = {}

    end

    def store( data )

      @data.merge!( data ) do |key, old, new|


      end

    end

  end

end
