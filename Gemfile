source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '4.2.1'
gem 'rails-api'
gem 'pg'
gem 'active_model_serializers'
gem 'rack-cors', :require => 'rack/cors'
gem 'puma'
gem 'devise'
gem 'sdoc', '~> 0.4.0', group: :doc

group :test, :development do
  gem 'rspec-rails'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'byebug'
  gem 'web-console'
  gem 'spring'
  gem 'colorize'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
end

group :production, :staging do
  gem 'rails_12factor', '0.0.3'
  gem 'rails_stdout_logging', '0.0.3'
end
