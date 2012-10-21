we :link

describe 'We::verbs' do

  context 'are predefined -' do

    context ':link' do

      it 'tracks the linking of spec files' do

        We::context[:linked_file].should == "we/verb/base"

      end

    end

  end

end
