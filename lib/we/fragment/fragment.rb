module We

  class Fragment < Document

    class_eval do

      We::defined[:fragment] = self
      We::Default.new( :fragment, :_tag, "fragment" ) 

    end

    def inject( data )

      super

      @data[:_type] = :fragment
      @data[:_tag] = We::default( :fragment, data )._tag

      ap self

    end

  end

end
