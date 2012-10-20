module We

  class << self

    def context

      @context

    end

    def process( *args, &block )

      #
      # a context is maintained throughout the spec run
      #

      @context = {} unless @context

      args.each do |arg|

        if arg.is_a? Symbol

          #
          # we has a predefined set of verbs
          # 

          if We::Verb::is_this? arg

            We::Verb::send( arg, args, &block )

          end

        end

      end

    end

    def link_spec( args, &block )

      @links = {} if @links.nil?

      args.each do |arg|

        @links[arg] = "#{arg}_spec.rb"

        require @links[arg]

      end

    end

  end

end

