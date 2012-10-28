describe We::Fragment do

  it 'declares itself as pre-defined' do

    We::defined[:fragment].should == We::Fragment

  end

  it 'defaults the _tag' do

    pending :linking

    We::push(:fragment)

    We::node.data[:_type].should == :fragment
    We::node.data[:_tag].should == "fragment"

    We::pop

  end

end
