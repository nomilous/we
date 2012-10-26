describe We::Node do 

  subject { We::Node.new }

  it 'has data' do

    subject.data.should be_a Hash

  end

  it 'can accumulate data' do

    subject.inject new: 'data'
    subject.data.should == { new: 'data' }

  end

  it 'has edges array' do

    pending 'needing edges in the node'
    #subject.edge.should be_a Array

  end

  it 'it defaults node type to Node' do

    We::type( :undefined ).should == We::Node

  end

  it 'can identify defined types' do

    We::type( document: 'title' ).should == We::Document

  end

end
