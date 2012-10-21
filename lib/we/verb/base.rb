module We

  module Verb

    class << self

      def register( args, &block )

        @verb_action = {} unless @verb_action

        if args.is_a? Symbol

          @verb_action[args] = block

        elsif args.is_a? Hash

          args.each_key do |key|

            @verb_action[key] = block

          end
          
        end

      end

      def custom_call( symbol, parameter, &block )

        if @verb_action.nil? or @verb_action[symbol].nil?

          We::warn "Undefined custom verb :#{symbol}"

          return

        end

        @verb_action[symbol].yield( parameter, block )

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
          custom_call( :fragment, spec_file, &block )
          We::enter_fragment( args, &block )

        end

      end

    end

  end

end
