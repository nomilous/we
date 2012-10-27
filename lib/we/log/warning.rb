module We

  class << self

    def warnings

      @warnings ||= {}

    end

    def warning!( warner )

      warnings[warner.keys.first] = warner[warner.keys.first]

    end

    def warning( warning )

      "warning"

    end

  end

  class Warning

    #

  end

end
