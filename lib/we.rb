#require 'we/base'
require 'we/config/config'
require 'we/walk/walk'
require 'we/tree/tree'
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

  We::walk( *args, &block )

end
