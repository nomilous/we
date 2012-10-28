module We

  class << self

    def validate( args )

      unless We::defined[We::primary args]
      
        We::log We::warning undefined_node: args

        return We::Node

      end

      return We::defined[We::primary args]

    end

    def primary( args )

      if args.is_a? Hash

        args.keys.first

      elsif args.is_a? Array

        args.first

      elsif args.is_a? Symbol

        args

      else 

        args

      end

    end

  end

end
