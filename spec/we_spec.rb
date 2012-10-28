describe We do

  it 'walks the tree' do

    We.should_receive( 

      :walk ).with need: 'things'

    we need: 'things'

  end

end
