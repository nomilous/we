describe 'We::stack' do

  it 'has a stack' do

    We::stack.should be_a Array

  end

  it 'creates the first node as specific type' do

    We::node( document: '' ).should be_a We::Document 

  end

  it 'pushes' do

    root = We::node()

    We::push( type: 'tag' )

    child = We::node

    We::stack[0].should == root

    #root.edge[0].should == child

  end

  it 'pops' do

    node = We::pop

    node.should be_a We::Node

  end

end
