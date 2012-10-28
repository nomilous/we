describe 'We::link' do


      #
      # TODO: Scope awareness on the link: directive
      #        
      #       - plugins will say: 
      #        
      #         we link: 'a parameter'
      # 
      #       - that will have different meanings for
      #         different plugins
      # 
      #       - walker needs to detect the edges of
      #         plugin scope 
      # 
      #         keeping a plugin scope stack
      # 
      #         each a their own link Node responder
      # 

  it 'links' do

    We::Link.any_instance.should_receive( :enter )

    we enable: :linking

    We::Link.new.inject( nil )

    we disable: :linking

  end

end
