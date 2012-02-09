$:.push File.expand_path("../lib", __FILE__)
require "em-serialport/version"

Gem::Specification.new do |s|
  s.name        = "em-serialport"
  s.version     = Em::Serialport::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Anup Narkhede"]
  s.email       = ["anup@infinitypulse.com"]
  s.homepage    = "http://anup.info"
  s.summary     = %q{EventMachine compatible serialport library}
  s.description = %q{}

  s.rubyforge_project = "em-serialport"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = ['serial-monitor']
  s.require_paths = ["lib"]

  s.add_dependency "eventmachine", "0.12.10"
  s.add_dependency "serialport"
end
