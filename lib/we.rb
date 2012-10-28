#require 'we/base'
require 'we/config/config'
require 'we/default/default'
require 'we/log/log'
require 'we/validate/validate'
require 'we/walk/walk'
require 'we/tree/tree'
require 'we/event/event'
require 'we/action/action'
require 'we/define/define'
require 'we/node/node'
require 'we/link/link'
require 'we/document/document'
require 'we/fragment/fragment'
require 'we/stack/stack'

def we( *args, &block ) 

  We::walk( *args, &block )

end
