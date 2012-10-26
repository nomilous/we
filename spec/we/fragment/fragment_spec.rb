describe We::Fragment do

  it 'declares itself as predefined' do

    We::defined[:fragment].should == We::Fragment

  end

end
