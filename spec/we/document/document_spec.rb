we document: 'A Document' do

  describe We::Document do

    it 'has "A Document" as the node_tag' do

      We::node.data[:node_tag].should == "A Document"

    end

    it 'sets the node type' do

      We::node.data[:type].should == :document

    end

  end

end
