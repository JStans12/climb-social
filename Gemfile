source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'

gem 'rails', '~> 5.0'
gem 'pg', '~> 0.19'
gem 'puma', '~> 3.7'
gem 'bcrypt', "~> 3.1"
gem 'jwt', "~> 1.5"
gem 'simple_command', "~> 0.0"


group :development, :test do
  gem 'byebug', "~> 9.0", platform: :mri
  gem 'rspec-rails', "~> 3.5"
  gem 'capybara', "~> 2.12"
  gem 'factory_girl_rails', "~> 4.8"
  gem 'launchy', "~> 2.4"
  gem 'database_cleaner', "~> 1.5"
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.0'
  gem 'spring', "~> 2.0"
  gem 'spring-watcher-listen', '~> 2.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
