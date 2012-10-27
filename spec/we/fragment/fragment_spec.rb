describe We::Fragment do

  it 'declares itself as pre-defined' do

    We::defined[:fragment].should == We::Fragment

  end

  it 'defaults the _tag' do

    pending

    we :fragment do

      We::node.data[:_type].should == :fragment
      We::node.data[:_tag].should == "fragment"

    end

  end

end

