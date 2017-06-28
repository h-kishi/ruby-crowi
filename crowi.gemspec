# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crowi/version'

Gem::Specification.new do |spec|
  spec.name          = "crowi"
  spec.version       = Crowi::VERSION
  spec.authors       = ["Hiromichi Kishi"]
  spec.email         = ["h.kishi47@gmail.com"]

  spec.summary       = %q{A ruby client for Crowi API}
  spec.description   = %q{A ruby client for Crowi API}
  spec.homepage      = "https://github.com/h-kishi/ruby-crowi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end