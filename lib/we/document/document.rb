module We

  class << self

    def document

      @document ||= {}

    end

  end

  class Document <  Fragment

    class_eval do

      We::defined[:document] = self

    end

  end

end
