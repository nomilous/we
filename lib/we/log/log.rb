require 'we/log/warning'

module We

  class << self

    def captains_log( stardate, message )

    end

    def log( messenger )

      unless messenger.nil?
      
        return messenger.call if messenger.is_a? Proc

        STDOUT << "#{messenger}\n"

      end

    end

  end

end
