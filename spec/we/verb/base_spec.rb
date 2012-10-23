we document: 'The Title', xtensible: 'A Maple Tree' do

  describe 'We::Verb(s)' do

    context 'generate events' do

      it 'for subscription' do

        We::Verb::on_enter :greet do; end
        We::Verb::on_exit :greet do; end

        We::Verb::should_receive( :emit ).with( :enter, {:greet=>"you"} )
        We::Verb::should_receive( :emit ).with( :exit, {:greet=>"you"} )

        we greet: 'you' do; end

      end

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

      we need: 'to enable user configurable fragment retreival and identification mechanisms'
      we need: 'to nest the fragment context to allow multiple parameters of fragment scope'

      it 'tracks the current fragment' do

        we :fragment do

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
