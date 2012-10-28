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

    We::action! node: Object
    We::actions_for( :node )[0].should == Object

  end

  it 'allows multiple handlers per node key' do

    We::action! node: Module
    We::action! node: Class
    We::action! node: lambda {}

    We::actions_for( 

      :node ).last.should be_a Proc

  end

  it 'allows onetime action registration' do

    pending

    We::action node: lambda {}

  end

end
