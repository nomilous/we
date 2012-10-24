describe We::Node do 

  subject { We::Node.new }

  it 'has data' do

    subject.data.should be_a Hash

  end

  it 'can accumulate data' do

    subject.store new: 'data'

    subject.data.should == { new: 'data' }

  end

end
