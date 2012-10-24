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

      end

      def exit

      end

    end

  end

end
