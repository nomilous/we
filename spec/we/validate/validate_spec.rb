describe 'We::validate' do

  it 'warns on undefined' do

    We::should_receive( :captains_log ).with( stardate, message )

    we activate: 'uncertainty shields'
    we activate: 'duality field'
    we activate: 'supersymmetry sensor array'
    we activate: 'entanglement phase array'
    we activate: 'causality phase array'
    
    we rotate: 'chaos manifold', in: [3,2,1,]

  end

end
