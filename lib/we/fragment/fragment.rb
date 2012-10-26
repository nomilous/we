module We

  class Fragment < Node

    class_eval do

      We::defined[:fragment] = self

    end

  end

end
