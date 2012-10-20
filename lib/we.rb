require 'we/base'

def we( *args, &block )

  block.call if block

end

def as( *args, &block )

  block.call if block

end

def to( *args, &block )

  block.call if block

end

def link( *args, &block )

  We::link( args, &block )

end
