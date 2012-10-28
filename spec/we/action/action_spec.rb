describe We::Action do

  context 'heads and tails the walk' do

    it 'and provides the current node' do

      We::Action::should_receive( :edge ).with(

        :enter, anything, be_a( We::Node ) )

      We::Action::should_receive( :edge ).with(
        
        :exit, anything, be_a( We::Node ) )

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

end
