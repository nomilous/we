module We

  class << self

    def global

      @global = {} unless @global

      @global

    end

  end

  module Global

    class << self

      def document( args, &block )

        we need: 'to do the same with :fragment'

        We::global[:document] = {} unless We::global[:document]
        We::global[:document][:title] = args[:document]
        We::global[:document].merge!( args )
        We::global[:document].delete :document # duplicate info
        We::enter_fragment( args, &block )

      end

    end

  end

end
