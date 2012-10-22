we document: 'To test depth' do 

  we need: 'to know the document depth' do

    describe 'We::global_context' do

      it 'carries the global context' do

        We::global[:document].should be_a Hash

      end

      we need: 'to know the document depth' do

        it 'knows the current depth' do

          pending 'seems rspec runs accum and executes after'

          We::global[:document][:current_depth].should == 3

        end

        it 'knows the depth reached' do

          we need: '1 more' do

            pending 'seems rspec runs accum and executes after'

          end

          pending 'seems rspec runs accum and executes after'

          we need: 'how deep it got' do

          end

          We::global[:document][:depth].should == 4

        end

      end

    end

  end

end
