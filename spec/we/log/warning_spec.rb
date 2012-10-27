describe 'We::warning' do

  it 'stores predefined warnings' do

    We::warnings.should be_a Hash

  end

  it 'allows registering warnings' do

    We::warning! warning_code: We::Warning.new

  end

  it 'emits warnings' do

    We::log We::warning warning_code: { args: '..,' }

  end

end
