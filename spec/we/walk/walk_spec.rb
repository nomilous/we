describe 'We::walk' do

  it 'assembles a tree' do

    We::tree.should be_a Hash

  end

  it 'does not enter the tree if walking is disabled' do

    entered = false

    we disable: :walking
    we enter: 'the tree' do
      entered = true
    end
    entered.should == false

    we enable: :walking
    we enter: 'the tree' do
      entered = true
    end
    entered.should == true

  end
    
end
