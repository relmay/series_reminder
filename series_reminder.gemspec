# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "series_reminder/version"

Gem::Specification.new do |spec|
  spec.name          = "series_reminder"
  spec.version       = SeriesReminder::VERSION
  spec.authors       = ["relmay"]
  spec.email         = ["nightterror@protonmail.ch"]

  spec.summary       = "A simple app that remembers the number of your last viewed series and can play next series."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/relmay/series_reminder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(bin)/})
  end
  spec.bindir        = "bin"
  spec.executables   = "series"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
