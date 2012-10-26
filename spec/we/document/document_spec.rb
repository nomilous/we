we document: 'A Tree', type: 'Baobab' do

  describe We::Document do

    it 'has "A Document" as the node_tag' do

      We::node.data[:_tag].should == "A Tree"

    end

    it 'sets the node type' do

      We::node.data[:_type].should == :document

    end

  end

end
