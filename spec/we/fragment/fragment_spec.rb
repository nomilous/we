describe We::Fragment do

  it 'declares itself as predefined' do

    We::defined[:fragment].should == We::Fragment

  end

  it 'defaults the _tag' do

    pending :NEXT, "and some sleep"

    we :fragment do

      We::node.data[:_type].should == :fragment
      We::node.data[:_tag].should == "fragment"

    end

  end

end
