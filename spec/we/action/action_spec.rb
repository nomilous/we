describe We::Action do

  it 'heads and tails the walk' do


    We::Action::should_receive( :edge ).with(

      :enter, anything, anything )

    We::Action::should_receive( :edge ).with(
      
      :exit, anything, anything )

    We::should_receive( :push )
    We::should_receive( :pop )

    We::walk nil

  end

  it 'stores registered action handlers in a Hash' do

    We::actions.should be_a Hash

  end

  it 'allows action handler registration' do

    We::action! node_key: Object
    We::actions_for( :node_key )[0].should == [Object, nil]

  end

  it 'allows multiple handlers per node key' do

    We::action! node_key: Module
    We::action! node_key: Class
    We::action! node_key: lambda {}

    We::actions_for( 

      :node_key ).last[0].should be_a Proc

  end

  it 'keeps reference to the block passed at action registration' do

    We::action! node_key: lambda {} do

      #
      # the Proc body 
      #

    end

    We::actions_for( :node_key ).last[0].should be_a Proc  # the lambda
    We::actions_for( :node_key ).last[1].should be_a Proc  # the block

  end

  it 'allows inline action / node registration' do

    we enable: :warning

    We::action! node_key: lambda { "Action Proc" }, node: Object

    We::defined[ :node_key ].should == Object

  end

  it 'allows onetime action registration' do

    pending :needing

    We::action node_key: lambda {} do; end

  end

end
