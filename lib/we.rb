require 'we/base'
require 'we/verb/base'

def we( *args, &block )

  We::process( *args, &block )

  block.call if block

end

def as( *args, &block )

  block.call if block

end

def to( *args, &block )

  block.call if block

end

def link_spec( *args, &block )

  We::link_spec( args, &block )

end
