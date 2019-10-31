source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch

gem 'solidus_auth_devise'

# Hack to force Rails 6 when using Solidus 2.10+ and prevent Bundler timeouts
if branch == 'master' || Gem::Version.new(branch[1..-1]) >= Gem::Version.new('2.10.0')
  gem 'rails', '~> 6.0.0'
else
  gem 'rails', '~> 5.2.0'
end

case ENV['DB']
when 'postgres'
  gem 'pg', '~> 0.21'
when 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'sqlite3'
end

gemspec
