require 'we/base'
require 'we/global'
require 'we/local'
require 'we/verb/base'
require 'we/event/event'

def we( *args, &block )

  We::process( *args, &block )

end

def as( *args, &block )

  block.call if block

end

def to( *args, &block )

  block.call if block

end
