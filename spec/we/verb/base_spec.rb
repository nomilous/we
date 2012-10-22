we document: 'The Title', xtensible: 'A Maple Tree' do

  describe 'We::Verb(s)' do

    it 'are registerable' do

      We::Verb::register( :verb ) do; end

      verb_handler = We::Verb::instance_variable_get( :@verb_action )[:verb]

      verb_handler.should be_a( Proc )

      verb_handler.should_receive( :yield ).with( anything, anything )

      we :verb do; end

    end

  end

  describe 'Predefined We::Verbs' do

    context ':document' do

      it 'updates the global document scope' do

        We::global[:document][:title].should == 'The Title'

      end

      it 'supports extended parameters' do

        We::global[:document][:xtensible].should == 'A Maple Tree'

      end

    end

    context ':fragment' do

      we :fragment do

        we need: 'to enable user configurable fragment retreival and identification mechanisms'
        we need: 'to nest the fragment context to allow multiple parameters of fragment scope'

        it 'tracks the current fragment' do

          We::local[:fragment].should == "we/verb/base"

        end

      end

    end

    context ':enable and :disable' do

      it 'manage config' do

        we enable: :thing

        We::config[:thing].should == :enabled

        we disable: :thing

        We::config[:thing].should == :disabled

      end

    end

  end

end
