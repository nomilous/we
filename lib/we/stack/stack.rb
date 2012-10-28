module We

  class << self

    def node

      #
      # We::node (the current node)
      #

      @node

    end

    def branch

      #
      # We::branch (the current branch)
      #

      @branch ||= We::tree

    end

    def stack

      @stack ||= []

    end

    def push( args )

      @node = We::validate( args ).new

      @node.inject( args )

      unless We::stack.size == 0

        @node.parent = branch
        @branch = branch[@node.data[:_tag]] = {}

      end
        
      branch.merge! @node.data
        
      @stack << @node

      return @node

    end

    def pop

      @node = @stack.pop

      @branch = @node.parent

      return @node

    end

  end

end
