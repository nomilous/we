describe 'We::config' do

  it ':enables and :disables anything' do

    we disable: :thing

    We::enabled?( :thing ).should == false

    we enable: :thing

    We::enabled?( :thing ).should == true

  end

  it 'returns true if a config was made' do

    We::config!( enable: :cytokinesis ).should == true

  end

  it 'returns false if a config was not made' do

    We::config!( fulgurate: :rhizome ).should == false

  end

  it 'defaults to disabled' do

    We::enabled?( :undefined ).should == false

  end

  it 'has defaults' do

    We::enabled?( :walking ).should == true
    We::enabled?( :linking ).should == false

  end

end
