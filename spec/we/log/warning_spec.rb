describe 'We::warning' do

  it 'stores predefined warnings' do

    pending :Warners

    We::warnings.should be_a Hash

  end

  it 'allows registering warnings' do

    pending :Warners

    We::warning! warning_code: We::Warning.new

  end

  it 'emits warnings' do

    We::should_receive( :log ).with( be_a Proc )

    We::log We::warning warning_code: { args: '..,' }

  end

  it 'is' do

    We::log We::warning warning_code: { args: '..,' }

  end

end
