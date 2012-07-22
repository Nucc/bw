# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bw/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nucc"]
  gem.email         = ["nucc@bteam.hu"]
  gem.description   = %q{Tool for calling methods in Ruby modules directly from command line}
  gem.summary       = %q{Bonanza Workspace}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bw"
  gem.require_paths = ["lib"]
  gem.version       = Bw::VERSION
end
