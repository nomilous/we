module We

  class << self

    def config

      @config = {

        linking: :disabled

      } unless @config

      @config

    end

    def set( settable, state )

      we pending_debt: 'config needs tidying'

      settable.each do |key, value|

        We::config[value] = state

      end

    end

    def state

      @state = {} unless @state

      @state

    end

    def enter_fragment( args, &block ); end
    def enter_node( args, &block ); end
    def exit_node( args, &block ); end

    def process( *args, &block )

      ap args

      args.each do |arg|

        if arg.is_a? Hash

          arg.each do |key, value|

            if We::Verb::is_this? key

              We::Verb::send( key, *args, &block )

            else

              We::Verb::custom_call( key, *args, &block )
              
            end

          end

        elsif arg.is_a? Symbol

          if We::Verb::is_this? arg

            We::Verb::send( arg, *args, &block )

          else 

            We::Verb::custom_call( arg, *args, &block )

          end

        end

      end

      We::enter_node( *args, &block )

      begin
        We::global[:document][:depth] += 1
        We::global[:document][:current_depth] += 1
        ap We::global
      rescue Exception => e; 

        ap e

      end

      block.call if block

      begin
        We::global[:document][:current_depth] -= 1
      rescue; end

      We::exit_node( *args, &block )

    end

    def warn( msg )

      #
      # TODO: colours
      #

      puts msg unless We::config[:warnings] == :disabled

    end

    def link_fragment( args, &block )

      @links = {} if @links.nil?

      return unless We::config[:linking] == :enabled

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

      require "#{base_name}_spec.rb"

    end

  end

end

