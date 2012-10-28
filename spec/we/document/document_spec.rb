we document: 'A Tree', type: 'Baobab' do

  describe We::Document do

    it 'has "A Tree" as the node_tag' do

      #raise We::tree.inspect

      We::tree[:_tag].should == "A Tree"

    end

    it 'sets the node type' do

      We::tree[:_type].should == :document

    end

  end

end
