source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

## DB
gem 'pg'

## Aut{enticación,orización}
gem 'devise'
gem 'cancan'

## Presentación
gem 'dynamic_form'
gem 'haml'

# No funciona la inclusión automática, asique la copié a vendor
gem 'browser_detect'

## Modelos
gem 'acts_as_list'

## GIS
gem 'activerecord-postgis-adapter'
# Esta gema falla con algún cambio de ActiveRecord
#gem 'postgis_adapter'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'pry'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
