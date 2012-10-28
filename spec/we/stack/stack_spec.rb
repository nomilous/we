describe 'We::stack' do

  it 'has a stack' do

    We::stack.should be_a Array

  end

  it 'push creates and returns the new child node' do

    We::push( document: 'title' ).should be_a We::Document
    We::node.should be_a We::Document
    We::pop

  end

  it 'keeps a stack' do

    We::push( document: 'DOC' )
    We::push( node: 'NODE' )
    We::stack[0].should be_a We::Document
    We::stack[1].should be_a We::Node
    We::stack[1].data[:_tag].should == "NODE"
    We::pop
    We::pop

  end

end
