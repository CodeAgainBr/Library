source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.7'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use mysql as the database for Active Record
# gem 'mysql2', '>= 0.3.18', '< 0.6.0'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Bootstrap for Rails
gem 'bootstrap', '~> 4.1.3'

# Use Devise for Authentication
gem 'devise'

# Simple-form
gem 'simple_form'

# Plugin jquery mask
gem 'jquery_mask_rails', '~> 0.1.0'

# Rails Admin is the best gem for manage database
gem 'rails_admin', '~> 1.3'
gem "rails_admin_import", "~> 2.1"

# Font Awesome 5
gem 'font_awesome5_rails'

# Toastr for alerts
gem 'toastr-rails'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
