describe We do

  it 'supports story declarations' do

    as 'product owner'

    to 'fully define requirements' do

      we need: 'story declarations'

      we need: 'more than one of them'

    end

  end

  it 'maintains a context' do

    We::context.should be_a( Hash )

  end

  it 'processes the arguments' do

    We.should_receive(

      :process ).with( { :need => 'things' }

    )

    we need: 'things'

  end

  it 'can link subcomponet specs' do

    link_spec 'we/base'

    We::instance_variable_get(

      :@links)['we/base'].should == 'we/base_spec.rb'

  end
  
end
