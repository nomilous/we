module We

  class << self

    def validate( args )

      unless We::defined[We::primary args]
      
        We::log We::warning UNKNOWN_ACTION, args

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

        #
        # to be decided:
        # 
        #  we 'string' do
        #  we 3 do 
        # 
        # some ideas pop to mind
        # 

        #
        # p.s.
        #
        we syn: lambda {}, hapstein: lambda {} do

          #
          # syn + hapstien |greek| ~ together to clasp
          #

        end

        args

      end

    end

  end

end
