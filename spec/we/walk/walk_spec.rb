describe 'We::walk' do

  it 'assembles a tree' do

    We::tree.should be_a Hash

  end

  it 'does not enter the tree if walking is disabled' do

    Proc.any_instance.should_not_receive :call
    
    we disable: :walking
    
    We::walk document: 'DOC' do; end

    we enable: :walking

  end

  it 'enters the tree if walking is enabled' do

    Proc.any_instance.should_receive :call
    
    we enable: :walking
    
    We::walk document: 'DOC' do; end

  end
    
end
