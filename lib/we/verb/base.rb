module We

  module Verb

    class << self

      def register( args, &block )

        @verb_action = {} unless @verb_action
        @verb_param = {} unless @verb_param

        if args.is_a? Symbol

          @verb_action[args] = block

        elsif args.is_a? Hash

          args.each_key do |key|

            @verb_action[key] = block
            @verb_param[key] = args[key]

          end
          
        end

      end

      def custom_call( symbol, &block )

        return if @verb_action[symbol].nil?

        parameter = @verb_param[symbol]

        @verb_action[symbol].yield( parameter, We::config, We::state, block )

      end

      def is_this?( symbol )

        case symbol

        when :fragment, :enable, :disable

          return true

        end

      end

      def enable( args, &block )

        We::set( args, :enabled )

      end

      def disable( args, &block )

        We::set( args, :disabled )

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

        if args[0] == :fragment

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

          We::context[:fragment] = spec_file
          We::enter_fragment( args, &block )

        end

      end

    end

  end

end
