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

    We::validate activate: 'uncertainty shields'
    We::validate activate: 'duality field'
    We::validate activate: 'supersymmetry sensor array'
    We::validate activate: 'entanglement phase array'
    We::validate activate: 'causality phase array'

    we enable: :warning

    We::should_receive( :warning ).with({

      :undefined_node => { :rotate=>"chaos manifold", :in=>[3, 2, 1]}

    })

    We::validate rotate: 'chaos manifold', in: [3,2,1,]

    we disable: :warning

  end

  it 'returns the Node type' do

    type = We::validate document: 'Title'
    type.should == We::Document

  end

end
