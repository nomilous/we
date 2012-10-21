we :fragment do

  describe 'We::verbs' do

    context 'are predefined -' do

      context ':fragment' do

        it 'tracks the linking of spec files' do

          STDERR << We::context.inspect

          We::context[:fragment].should == "we/verb/base"

        end

      end

    end

  end

end
