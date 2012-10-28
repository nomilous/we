describe 'We::tree' do

  it 'is a hash' do

    We::tree.should be_a Hash

  end

  it 'the root node data is on the hash root' do

    We::push( document: 'DOC' )
    
    We::tree[:_type].should == :document

    We::pop

  end

  it 'stores child nodes are keyed at their :_tag' do

    We::push( document: 'DOC' )
    We::push( node: 'NODE1' )

    We::tree['NODE1'][:_type].should == :node

    We::pop
    We::pop

  end

  it 'child nodes are not keyed at their :_tag' do

    pending :decision

  end

end
