module We

  class << self

    def document

      @document ||= {}

    end

  end

  class Document <  Fragment

  end

end
