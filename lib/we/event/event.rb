module We

  module Event

    #
    # For the case of a tree (not a graph)
    #

    class << self

      def edge( direction, args )

        send direction, args # :enter | :exit

      end

      def enter( args )

        We::node( args )

        We::node.inject( args ) if args.is_a? Hash

        if We::stack.size == 0

          We::Event::begin

        end

        We::push

      end

      def exit( args )

        We::pop

        if We::stack.size == 0

          We::Event::end

        end

      end

      def begin

      end

      def end

        ap We::tree

      end

    end

  end

end
