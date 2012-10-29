module We

  class Link < We::Node

    class_eval do

      We::defined[:link] = self

    end

    def inject( args )

      super

      #
      # walk over the fragment edge
      #

      enter if (

        We::enabled? :walking and 
        We::enabled? :linking

      ) 

    end

    def enter

      #
      # some housekeeping
      # 
      # - scope awareness
      #

      traverse # plugin overrides

    end

    def traverse; end

  end

end
