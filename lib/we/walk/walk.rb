module We

  class << self

    def walk( args, &block )

      return if config! args

      We::Event::edge( :enter, args )

      We::Action::edge( :enter, args, We::node )

      block.call if block and We::enabled? :walking

      We::Action::edge( :exit, args, We::node )

      We::Event::edge( :exit, args )

    end

  end

end
