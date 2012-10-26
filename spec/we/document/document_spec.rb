we document: 'A Document' do

  describe We::Document do

    it 'We has "A Document" as the current Node' do

      We::node.data[:document].should == "A Document"

    end

  end

end
