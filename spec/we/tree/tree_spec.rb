describe 'We::tree' do

  before :each do

    we document: 'Tree' do

      we node: 'Parent Node' do

        we node: 'Child Node 1' do 

        end

        we node: 'Child Node 2' do; end

      end

    end

  end

  it 'has _tag as key (for now)' do

    We::tree['Tree'][
      'Parent Node'][
     'Child Node 2'][
            :_class].should == :node

  end

  it 'should not have :document as the type for Node' do

    pending "    PUSH NEEDS ATTENTION"

    We::tree['Tree']['Parent Node'][
      :_type].should == :node

  end

  it 'might NOT have _tag as key soon' do

    pending :fragment_storage_challenge
    pending :a_few_encounters_with_actual_usage

  end

end
