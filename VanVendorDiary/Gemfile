source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use bcrypt to hash password
gem 'bcrypt', '3.1.9'
# Fake users for testing
gem 'faker', '1.4.2'
# Paginate users so that only part of the list show up at a time.
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
# Converts Less to Sass.
gem 'bootstrap-sass', '3.2.0.0'
# Recommended, it automatically adds the proper vendor prefixes to CSS code at compile time.
gem 'autoprefixer-rails'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.5.3'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.0.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.3.0'
# Fixes binding of events problems in jQuery caused by Turbolinks
gem 'jquery-turbolinks', '2.1.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.3'
# Enables use of Ruby objects in Javascript
gem 'gon', '5.2.3'
gem 'roo', '1.13.2'
gem 'spreadsheet', '1.0.3'
gem 'iconv', '1.0.4'
gem 'seed_dump', '3.2.2'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.0', group: :doc

# To get rid of ExecJS error in Windows
gem 'coffee-script-source', '1.8.0'
# To get rid of more errors in Windows
gem 'tzinfo'
gem 'tzinfo-data'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# puma does not time out, if we use puma server, we need to timeout.

gem 'rack-timeout'

gem 'omniauth-facebook'

gem 'faraday'

# Added for admin user
gem 'activeadmin', github: 'activeadmin'
# Added to manage environment variable.
gem 'figaro'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '3.4.0'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '2.1.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.1.3'

  # Railroady helps generate uml graphs using rake diagram:all or rake diagram:all_with_engines. https://github.com/preston/railroady
  gem 'railroady'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace', '0.1.3'
  gem 'guard-minitest', '2.3.1'
end

group :production do
  # Add PostgreSQL gem for Heroku.
  gem 'pg', '0.17.1'
  # rails_12factor gem is used by Heroku to serve static assets such as images and stylesheets.
  gem 'rails_12factor', '0.0.2'
  gem 'puma', '2.11.1'
end
