describe We do

  it 'declares actor and requirement and components' do

    as 'product owner'

    to 'define requirements' do

      we need: 'requirement declarations'

      we need: 'more than one of them'

    end

  end

  it 'can link subcomponet specs' do

    link 'we/base'

    We::instance_variable_get(

      :@links)['we/base'].should == 'we/base_spec.rb'

  end
  
end
