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

  it 'pushes' do

    pending We::Node && We::Stack

  end

  it 'pops' do

    pending We::Node && We::Stack

  end

end
