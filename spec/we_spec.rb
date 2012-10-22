describe We do

  it 'maintains a global context' do

    We::global.should be_a( Hash )

  end

  it 'maintains a local context' do

    We::local.should be_a( Hash )

  end

  it 'processes the arguments' do

    We.should_receive(

      :process ).with( { :need => 'things' }

    )

    we need: 'things'

  end

  it 'generates events' do

    pending ':noun, :verb'

  end

  it 'can link fragments' do

    we need: 'to config link mech'

    We::should_receive( :link_fragment )

    link_fragment 'we/base' # , :file | :uri  |  :...

  end

end
