module We

  class << self

    def walk( *args, &block )

      We::Event::edge( :enter )

      We::Event::edge( :exit )

    end

  end

end
