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

    def push( args )

      We::graft @node

      child = We::validate( args ).new
      # @node.edge << child
      @stack << @node
      @node = child

    end

    def pop

      We::pleach

      @node = @stack.pop

    end

  end

end
