require 'we/base'
require 'we/verb/base'

def we( *args, &block )

  We::process( *args, &block )

end

def as( *args, &block )

  block.call if block

end

def to( *args, &block )

  block.call if block

end

def linking; 

  :linking

end

def link_fragment( *args, &block )

  We::link_fragment( args, &block )

end
