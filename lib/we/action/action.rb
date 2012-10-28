module We

  class << self

    def actions

      @actions ||= {}

    end

    def action!( args, &block )

      node_type, defined = validate( args )

      unless defined

        log warning action_on_unknown_node: args

        return

      end

      #
      # register action
      #

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
