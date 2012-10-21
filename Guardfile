guard 'rspec', 

  :cli => "--color --format doc -r config/rspec",
  :all_on_start => false,
  :all_after_pass => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/config/(.+)\.rb$})  { "spec" }
end
