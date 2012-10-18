$LOAD_PATH.unshift 'lib'
Gem::Specification.new do |spec|
  spec.name = %q{we}
  spec.version = '0.0.2' 
  spec.date = DateTime.now.strftime( "%Y-%m-%d" )
  spec.authors = ["nomilous","","",""]
  spec.email = %q{}
  spec.summary = %q{we is a gem}
  spec.homepage = %q{https://github.com/nomilous/we}
  spec.description = %q{}
  spec.files = `git ls-files`.strip.split("\n")
end
