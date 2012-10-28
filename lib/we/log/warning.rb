module We

  class << self

    def warnings

      @warnings ||= {}

    end

    def warning!( warner )

      warnings[warner.keys.first] = warner[warner.keys.first]

    end

    def warning( warns )

      return lambda do

        STDOUT << "WARNING ~ #{warns.keys.first} ~ #{warns[warns.keys.first]}\n"
        
      end if We::enabled? :warning

    end

  end

  # class Warning  
  #  # pending :Warners
  # end

end
