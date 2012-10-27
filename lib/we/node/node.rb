module We

  class << self

    def type( args )

      #
      # returns default or pre-defined Node types
      #

      unless args.is_a? Hash

        unless args.is_a? Symbol

          return We::Node

        end

        return defined[args] || We::Node

      end

      return defined[args.keys.first] || We::Node

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

      if data.is_a? Symbol

        @data[:_class] = data
        @data[:_tag] = data


      elsif data.is_a? Hash

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

end
