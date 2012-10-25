module We

  class << self

    def config

      @config ||= {

        walking: :enable,
        linking: :disable

      }

    end

    def enabled?( setting )

      config[setting] == :enable

    end

    def config!( hash )

      return false unless hash.is_a? Hash
      return false unless hash[:enable] or hash[:disable]

      [:enable, :disable].each do |s|

        config[hash[s]] = s if hash[s]

      end

      return true

    end

  end

end
