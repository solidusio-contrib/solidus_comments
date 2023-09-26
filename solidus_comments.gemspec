# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_comments/version'

Gem::Specification.new do |s|
  s.name = 'solidus_comments'
  s.version = SolidusComments::VERSION
  s.summary = 'Adds comments to the solidus admin'
  s.license = 'BSD-3-Clause'

  s.author = ['Rails Dog', 'Solidus Contrib']
  s.email = 'contact@solidus.io'
  s.homepage = 'https://github.com/solidusio-contrib/solidus_comments'

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.required_ruby_version = '>= 2.5'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'deface', '~> 1.5'
  s.add_dependency 'solidus_core', ['>= 2.0.0', '< 4']
  s.add_dependency 'solidus_backend', ['>= 2.0.0', '< 4']
  s.add_dependency 'solidus_support', '~> 0.5'

  s.add_development_dependency 'solidus_dev_support'
  s.add_development_dependency 'shoulda-matchers', '~> 4.0'
end
