require 'awesome_print'
require 'config/before_all'

RSpec::configure do |config|

  config.before(:all) { require 'config/before_all' }
  config.before(:each) {}
  config.after(:all) {}
  config.after(:each) {}

end
