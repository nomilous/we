module We

  class << self

    def node

      #
      # We::node (the current node)
      #

      @node = Node.new unless @node
      @node

    end

    def stack

      @stack = [] unless @stack
      @stack

    end

    def push

      child = Node.new
      # @node.edge << child
      @stack << @node
      @node = child

    end

    def pop

      @node = @stack.pop
      @node

    end

  end

end
