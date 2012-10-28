module We

  class << self

    def actions

      @action ||= {}

    end

    def action!( args, &block )

    end

  end

  module Action

    class << self

      def edge( direction, args, node, tree = nil )

        #

      end

    end

  end

end
