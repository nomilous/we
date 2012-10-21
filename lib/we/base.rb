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

    def enter_fragment( args, &block ); end
    def enter_node( args, &block ); end
    def exit_node( args, &block ); end

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

          else 

            We::Verb::custom_call( arg, &block )

          end

        end

      end

      We::enter_node( *args, &block )

      block.call if block

      We::exit_node( *args, &block )

    end

    def warn( msg )

      #
      # TODO: colours
      #

      puts msg

    end

    def link_fragment( args, &block )

      @links = {} if @links.nil?

      return unless We::settings[:linking] == :enabled

      base_name = ""

      args.each do |arg|

        base_name = "#{arg}" if arg.is_a? String

      end

      unless /^\s{0,}we\s{1,}\:fragment\s{0,}do\s{0,}(;|$)/.match( 

          File.read( "spec/#{base_name}_spec.rb" ) )

          warn "Unspecified 'we :fragment do' block in spec/#{base_name}_spec.rb"

      end

      @links[base_name] = "#{base_name}_spec.rb"

      require @links[base_name]

    end

  end

end

