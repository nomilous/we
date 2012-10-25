require 'we/base'
require 'we/event/event'
require 'we/node/node'
require 'we/stack/stack'
require 'we/fragment/fragment'
require 'we/document/document'


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
