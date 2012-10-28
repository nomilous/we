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

        if We::stack.size == 0

          We::Event::begin

        end

        We::push( args )

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

        # ap We::tree

      end

    end

  end

end
