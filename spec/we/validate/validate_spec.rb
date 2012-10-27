describe 'We::validate' do

  it 'extracts primary from args when Hash' do

    We::primary( document: 'Title' ).should == :document

  end

  it 'extracts primary from args when Array' do

    We::primary( [:fragment, :mode_] ).should == :fragment

  end

  it 'extracts primary from args single symbol' do

    We::primary( :fragment ).should == :fragment

  end

  it 'warns on undefined' do

    pending 'We::warning'

    We::should_receive( :warn )

    we activate: 'uncertainty shields'
    we activate: 'duality field'
    we activate: 'supersymmetry sensor array'
    we activate: 'entanglement phase array'
    we activate: 'causality phase array'

    we rotate: 'chaos manifold', in: [3,2,1,] do

    end

  end

  it 'returns the Node type' do

    type = We::validate document: 'Title'
    type.should == We::Document

  end

end
