module We

  class << self

    def link( args, &block )

      @links = {} if @links.nil?

      args.each do |arg|

        @links[arg] = "#{arg}_spec.rb"

        require @links[arg]

      end

    end

  end

end
