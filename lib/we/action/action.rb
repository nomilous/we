module We

  class << self

    def actions

      @actions ||= {}

    end

    def actions_for( node_key, actor = nil )

      #
      # may need to exted to a hash
      # later to enable unregister
      #

      actions[node_key] ||= []

      unless actor.nil?

        actions[node_key] << actor

      end

      return actions[node_key]

    end

    def action!( args, &block )

      node_type, defined = We::validate( args )

      unless defined

        We::log We::warning action_on_unknown_node: args

        return

      end

      primary_key = We::primary args

      actions_for primary_key, [args[primary_key], block]

    end

    def action( args, &block )

      #
      # TODO: Set a run-once node action responder
      #       that fires at the next instance of the
      #       specified Primary
      #

      #
      # spring |noun| ~ not only a season
      # 
      #    ipso.
      # 
      #       Mouse
      # 
      # 
      #    facto.
      # 
      #       Cheese!
      # 

    end 

  end

  module Action

    class << self

      def edge( direction, args, node, tree = nil )

        #
        # only tail recursion for now
        #

        return unless direction == :exit

        primary_key = We::primary args

        We::actions_for( primary_key ).each do |action|

          ap action

        end

      end

    end

  end

end
