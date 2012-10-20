we :link

describe 'We::verbs' do

  context 'are predefined -' do

    context ':link' do

      it 'tracks the currently running spec file' do

        We::context[:current_file].should == "we/verb/base"

      end

    end

  end

end
