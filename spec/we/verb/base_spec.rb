we :fragment do

  describe 'We::Verbs' do

    context 'are predefined -' do

      context ':fragment' do

        it 'tracks the linking of spec files' do

          We::context[:fragment].should == "we/verb/base"

        end

      end

    end

    it 'are registerable' do

      We::Verb::register( verb: :parameter ) do; end

      verb_handler = We::Verb::instance_variable_get( :@verb_action )[:verb]

      verb_handler.should be_a( Proc )

      verb_handler.should_receive( :yield ).with( :parameter, anything, anything )

      we :verb do; end

    end

  end

end
