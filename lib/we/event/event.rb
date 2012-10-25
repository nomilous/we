module We

  module Event

    #
    # For the case of a tree (not a graph)
    #

    class << self

      def edge( direction )

        #
        # walker entered a node (and exited** another)
        # 
        #        **popped out for a moment
        #

        send direction

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

        puts "\n\n   --->BEGIN\n\n"

      end

      def end

        puts "\n\n   --->END\n\n"

      end

    end

  end

end
