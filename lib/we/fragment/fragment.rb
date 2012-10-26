module We

  class Fragment < Document

    class_eval do

      We::defined[:fragment] = self

    end

  end

end
