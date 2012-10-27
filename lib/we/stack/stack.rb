module We

  class << self

    def node( args = nil )

      #
      # We::node (the current node)
      #

      @node ||= We::validate( args ).new

    end

    def stack

      @stack ||= []

    end

    def branch

      @branch ||= We::tree

    end

    def push( args )

      # We::graft @node

      @branch = branch[node.data[:_tag]] = {}
      branch.merge! node.data

      child = We::validate( args ).new
      child.parent = branch

      # @node.edge << child
      @stack << @node

      @node = child

    end

    def pop

      @node = @stack.pop

      unless stack.length == 0

        @branch = @node.parent

      else

        @branch = @tree

      end

      @node

    end

  end

end
