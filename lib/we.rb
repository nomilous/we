#require 'we/base'
require 'we/config/config'
require 'we/default/default'
require 'we/walk/walk'
require 'we/tree/tree'
require 'we/event/event'
require 'we/node/node'
require 'we/define/define'
require 'we/document/document'
require 'we/fragment/fragment'
require 'we/stack/stack'

require 'we/global'
require 'we/local'
require 'we/verb/base'
require 'we/event/event'

def we( *args, &block ) 

  We::walk( *args, &block )

end
