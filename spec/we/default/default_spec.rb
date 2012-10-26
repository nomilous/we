describe 'We::default' do

  it 'allows assignable defaults' do

    We::Default.new( :fragment, :_tag, "text" ) 
    We::default( :fragment )._tag.should == 'text'

  end

  it 'returns DEFAULT if unspecified' do

    We::default( :defaultless ).field.should == "DEFAULT"

  end

end
