Gem::Specification.new do |s|
  s.platform  = Gem::Platform::RUBY
  s.name      = 'solidus_comments'
  s.version   = '1.0.1'
  s.summary   = 'Adds comments to the solidus admin'
  s.required_ruby_version = '>= 2.1'

  s.author    = ['Rails Dog', 'Solidus Contrib']
  s.email     = 'contact+comments@solidus.io'
  s.homepage  = 'https://github.com/solidusio-contrib/solidus_comments'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path  = 'lib'
  s.requirements << 'none'

  solidus_version = ['>= 1.0', '< 3']

  s.add_dependency 'acts_as_commentable', '4.0.1'
  s.add_dependency 'deface'
  s.add_dependency 'solidus_api', solidus_version
  s.add_dependency 'solidus_backend', solidus_version
  s.add_dependency 'solidus_core', solidus_version

  s.add_development_dependency 'capybara', '~> 2.18'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'chromedriver-helper', '~> 1.2' unless ENV['CI']
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'sqlite3', '~> 1.3.6'
end
