module We

  class << self

    def node( args = nil )

      #
      # We::node (the current node)
      #

      @node ||= type( args ).new  # :NEXT: not making a :fragment

    end

    def stack

      @stack ||= []

    end

    def push( args )

      We::graft @node

      child = type( args ).new
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
