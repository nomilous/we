describe 'A Wee::Event' do

  it 'is very small' do 
  end

  it 'is chiefly scottish' do
  end

end

describe We::Event do

  it 'is generated when the walker goes over an edge' do

    #
    # http://en.wikipedia.org/wiki/Edge_(graph_theory)
    #

    We::Event::should_receive( :edge ).twice

    we enter_and_exit: 'this node' do

      'inside the node'

    end

    'and back out'

  end

  it 'has direction' do

    We::Event::should_receive( :enter ).once
    We::Event::should_receive( :exit ).once

    we :enter_and_exit do; end

  end

  it 'pushes and pops' do

    We::should_receive( :push ).once
    We::should_receive( :pop ).once

    we :enter_and_exit do; end

  end

  it 'it begins' do

    We::Event::should_receive( :begin ).once
    We::Event::should_receive( :end ).once

    we :first_node_entered do

      We::Event::should_not_receive( :begin )

      we :second_node_entered do

      end

    end

  end

end
