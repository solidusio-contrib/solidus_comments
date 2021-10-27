# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_comments/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_comments'
  spec.version = SolidusComments::VERSION
  spec.summary = 'Adds comments to the solidus admin'
  spec.license = 'BSD-3-Clause'

  spec.author = ['Rails Dog', 'Solidus Contrib']
  spec.email = 'contact@solidus.io'
  spec.homepage = 'https://github.com/solidusio-contrib/solidus_comments'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.required_ruby_version = '>= 2.5'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'acts_as_commentable', '~> 4.0'
  spec.add_dependency 'deface', '~> 1.5'
  spec.add_dependency 'solidus_backend', ['>= 2.0.0', '< 4']
  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 4']
  spec.add_dependency 'solidus_support', '~> 0.5'

  spec.add_development_dependency 'shoulda-matchers', '~> 4.0'
  spec.add_development_dependency 'solidus_dev_support', '~> 2.5'
end
