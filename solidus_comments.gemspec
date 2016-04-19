# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform  = Gem::Platform::RUBY
  s.name      = 'solidus_comments'
  s.version   = '1.0.0'
  s.summary   = 'Adds comments to the solidus admin'
  s.required_ruby_version = '>= 2.1'

  s.author    =  [ 'Rails Dog', 'Solidus Contrib' ]
  s.email     = 'contact+comments@solidus.io'
  s.homepage  = 'https://github.com/solidusio-contrib/solidus_comments'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path  = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'solidus_core', ["~> 1.0"]
  s.add_runtime_dependency 'solidus_backend', ["~> 1.0"]
  s.add_runtime_dependency 'solidus_api', ["~> 1.0"]
  s.add_runtime_dependency 'deface'
  s.add_dependency 'acts_as_commentable', '4.0.1'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'database_cleaner'
end
