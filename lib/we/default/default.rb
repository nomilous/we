module We

  class << self

    def defaults

      @defaults ||= {}

    end

    def default!( action, defaulter )

      defaults[action] = defaulter

    end

    def default( action, key = nil )

      begin

        return defaults[action] if defaults.has_key? action

      rescue; end

      Default.new( nil, nil, "DEFAULT" )

    end

  end

  class Default

    def initialize( action, key, value = nil )

      @action = action
      @key = key
      @value = value

      We::default!( action, self )

    end

    def method_missing( symbol, *args, &block )

      super if @value.nil?

      @value 

    end

  end

end
