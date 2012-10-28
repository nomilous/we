describe We::Node do 

  subject { We::Node.new }

  it 'has data' do

    subject.data.should be_a Hash

  end

  it 'can accumulate data' do

    subject.inject action: 'text', tag: 'may happen'
    subject.data.should == { 

      _type: :node,
      _class: :action,
      _tag: 'text',
      tag: 'may happen'

    }

  end

  it 'maintains reference to parent node' do

    subject.parent
    
  end

end
