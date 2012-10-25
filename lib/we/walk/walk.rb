module We

  class << self

    def walk( args, &block )

      return if config! args

      We::Event::edge( :enter, args )

      We::Event::edge( :exit, args )

    end

  end

end
