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

    we enable: :warning

    We::should_receive( :log ).with( be_a Proc )

    We::log We::warning warning_code: { args: '..,' }

    we disable: :warning

  end

end
