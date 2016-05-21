# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bassy/version'

Gem::Specification.new do |spec|
  spec.name          = "bassy"
  spec.version       = Bassy::VERSION
  spec.authors       = ["Pawan Dubey"]
  spec.email         = ["pawandubey@outlook.com"]

  spec.summary       = %q{A simple gem to convert a number between two bases.}
  spec.description   = %q{Bassy takes a number and convert it from a given base to the specified base.}
  spec.homepage      = "https://github.com/pawandubey/bassy"
  spec.license       = "Apache License Version 2"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
