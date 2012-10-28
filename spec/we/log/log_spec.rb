describe 'We::log' do

  it "logs string messages" do

    STDOUT.should_receive( :<< ).with( "message\n" )
    We::log( "message" )

  end

  it 'calls messenger procs' do

    we enable: :warning
    Proc.any_instance.should_receive( :call )
    We::log We::warning warning_code: { pay: 'load' }
    we disable: :warning

  end

end
