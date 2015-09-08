source 'https://rubygems.org'

ruby '2.2.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'haml-rails'
gem 'pg'
gem 'pundit'
gem 'simple_form'
gem 'upmin-admin'
gem 'rails_email_validator'
gem 'activerecord-session_store'

gem 'faker'
gem 'kaminari'
gem "paperclip", "~> 4.3"
gem 'aws-sdk', '< 2.0'

gem 'devise'
gem 'devise_security_extension'
gem 'devise_invitable'
gem 'omniauth'
gem 'devise-token_authenticatable'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'byebug'

  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'html2haml'
  gem 'thin'
  gem 'quiet_assets'
  gem 'rails_apps_pages'
  gem 'rails_layout'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end