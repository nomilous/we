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

  it 'can link specs' do

    We::should_receive( :link_spec )

    link_spec 'we/base'

  end

end
