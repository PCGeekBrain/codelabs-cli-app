# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "code_labs/version"

Gem::Specification.new do |spec|
  spec.name          = "code_labs"
  spec.version       = CodeLabs::VERSION
  spec.authors       = ["Menachem Hornbacher"]
  spec.email         = ["me@mendel.tech"]

  spec.summary       = "Pulls and parses gems from Google CodeLabs"
  spec.description   = "Uses Nokogiri and open-uri to pull a list of courses from Google CodeLabs and make them browsable from the CLI"
  spec.homepage      = "http://rubygems.org/gems/code_labs"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.executables << '../bin/code-labs'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_dependency "nokogiri", '~> 1'
end
