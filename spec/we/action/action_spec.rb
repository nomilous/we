describe We::Action do

  context 'heads and tails the walk' do

    it 'and provides the current node' do

      We::Action::should_receive( :edge ).with(

        :enter, anything, be_a( We::Node ) )

      We::Action::should_receive( :edge ).with(
        
        :exit, anything, be_a( We::Node ) )

      We::walk nil

    end

    it 'stores registered actions in a Hash' do

      We::actions.should be_a Hash

    end

  end

end
