we :fragment do

  describe We do

    it 'can link subcomponet specs' do

      we enable: linking

      link_fragment 'we/verb/base'

      We::instance_variable_get(

        :@links)['we/verb/base'].should == 'we/verb/base_spec.rb'

    end

    it 'only links subcomponent specs when linking is enabled' do

      we disable: linking

      We::instance_variable_set(:@links, {})

      link_fragment 'we/verb/base'

      We::instance_variable_get(

        :@links)['we/verb/base'].should == nil

    end

    it 'warns when linking to a spec that is not declared as lined' do

      we enable: linking

      We::should_receive( :warn ).with( 

        "Unspecified 'we :fragment do' block in spec/we/unlinked_spec.rb" 

      )

      link_fragment 'we/unlinked'

    end

    it 'maintains a list of linked spec edges' do

      pending

    end

  end

end