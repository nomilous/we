module We

  module Verb

    class << self

      def on_enter( verb, &block )

        at :enter, verb, &block

      end

      def on_exit( verb, &block )

        at :exit, verb, &block

      end

      def subscribers

        @subscribed = {} unless @subscribed

        @subscribers = {

          enter: {}, exit: {} #, error: {}

        } unless @subscribers

        @subscribers

      end

      def at( event, verb, &block )

        return unless event == :enter or event == :exit

        subscribers[event][verb] = [] unless subscribers[event][verb]

        @subscribed[verb] = 1

        subscribers[event][verb] << block

      end

      def emit( event, args, &block )

        if args.is_a? Symbol

          verb = args

        elsif args.is_a?( Hash )

          args.each_key do |key|

            #
            # get the first key from a Hash?
            #

            verb = key

            break

          end

        else

          return

        end

        if event == :enter and builtin? verb

          send verb, args, &block

        end

        if subscribers[event][verb].nil?

          if @subscribed[verb].nil?

            We::warn "Unsubscribed: #{verb}" 

          end

          return

        end

        subscribers[event][verb].each do |block|

          block.yield args, block

        end

      end

      # def register( args, &block )

      #   @verb_action = {} unless @verb_action

      #   if args.is_a? Symbol

      #     @verb_action[args] = block

      #   elsif args.is_a? Hash

      #     args.each_key do |key|

      #       @verb_action[key] = block

      #     end
          
      #   end

      # end

      # def custom_call( symbol, parameter, &block )

      #   if @verb_action.nil? or @verb_action[symbol].nil?

      #     unless parameter.nil?

      #       We::warn "Undefined custom_call = :#{symbol}"

      #       return

      #     end

      #     We::warn "Undefined custom_call = :#{symbol}, parameter = '#{parameter[symbol]}'"

      #     return

      #   end

      #   @verb_action[symbol].yield( parameter, block )

      # end

      def builtin?( symbol )

        case symbol

        when :fragment,   # entering a fragment
             :link_file,  # call to link
             :enable,     
             :disable, 
             :document    # document root

          return true

        end

      end

      def enable( args, &block )

        We::set( args, :enabled )

      end

      def disable( args, &block )

        We::set( args, :disabled )

      end

      def document( args, &block )

        We::Global::document( args, &block )

      end

      def link_file( args, &block )

        # 
        # we link_file: 'we/base', mode: 'PENDING'
        # 
        # - Destination may or may not be the start
        #   of a new fragment
        #

        We::link( args, &block )

      end

      def fragment( args, &block )

        #
        # upon entering a new fragment
        #
        # we :fragment do
        # 
        #   ...
        # 
        # end
        #

        if args == :fragment

          spec_file = ""

          caller.each do |call|

            #
            # search fr the calling spec
            # makes 3 assumptions that may NOT ALWAYS be true
            #
            #    */spec/*            determines the spec root
            #    *_spec.rb           detarmines a spec file
            #  
            # 

            if call =~ /_spec.rb/ 

              begin

                spec_file = call.split(/_spec.rb/)[0].split("/spec/")[1]

              rescue; 

                # spec_file comes up empty if the assumptions were wrong

              end

              break

            end

          end

          We::local[:fragment] = spec_file
          #emit( :fragment, spec_file, &block )
          #We::enter_fragment( args, &block )

        end

      end

    end

  end

end
