module We

  module Event

    #
    # For the case of a tree (not a graph)
    #

    class << self

      def edge( direction, args )

        We::node.inject( args ) if args.is_a? Hash

        send direction # :enter | :exit

      end

      def enter

        if We::stack.size == 0

          We::node

          We::Event::begin

        end

        We::push

      end

      def exit

        We::pop

        if We::stack.size == 0

          We::Event::end

        end

      end

      def begin

      end

      def end

        ap We::node.data

      end

    end

  end

end
