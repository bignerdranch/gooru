# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gooru/version'

Gem::Specification.new do |gem|
  gem.name          = "gooru"
  gem.version       = Gooru::VERSION
  gem.authors       = ["Brandon Beacher"]
  gem.email         = ["brandon.beacher@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{The gooru gem allows your Ruby app to talk to the Gooru API}
  gem.homepage      = "https://github.com/highgroove/gooru"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
