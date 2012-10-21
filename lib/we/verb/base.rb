module We

  module Verb

    class << self

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

        puts "                      INTO NEW FRAGMENT"

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
