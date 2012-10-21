module We

  class << self

    def settings

      @settings = {

        linking: :disabled

      } unless @settings

      @settings

    end

    def set( settable, state )

      unless settable.is_a? Array

        return We::settings[settable] = state

      end

      settable.each do |setting|

        We::settings[setting] = state

      end

    end

    def context

      @context = {} unless @context

      @context

    end

    def state

      @state = {} unless @state

      @state

    end

    def process( *args, &block )

      args.each do |arg|

        if arg.is_a? Hash

          arg.each do |key, value|

            if We::Verb::is_this? key

              We::Verb::send( key, value, &block )

            end

          end

        elsif arg.is_a? Symbol

          if We::Verb::is_this? arg

            We::Verb::send( arg, args, &block )

          end

        end

      end

      block.call if block

    end

    def warn( msg )

      #
      # TODO: colours
      #

      puts msg

    end

    def link_spec( args, &block )

      @links = {} if @links.nil?

      return unless We::settings[:linking] == :enabled

      base_name = ""

      args.each do |arg|

        base_name = "#{arg}" if arg.is_a? String

      end

      unless /^\s{0,}we\s{1,}\:link\s{0,}(;|$)/.match( 

          File.read( "spec/#{base_name}_spec.rb" ) )

          warn "Unspecified 'we :link' in spec/#{base_name}_spec.rb"

      end

      @links[base_name] = "#{base_name}_spec.rb"

      require @links[base_name]

    end

  end

end

