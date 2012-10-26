module We

  class << self

    def document

      @document ||= {}

    end

  end

  class Document < Node

    class_eval do

      We::defined[:document] = self

    end

    def inject( data )

      super

      @data[:type] = :document

    end

  end

end
