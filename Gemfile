source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0.rc1'

# gem 'airbrake',        '~> 3.1.12' # Report exceptions in production #FIXME: Breaks zeus
gem 'andand',           '> 0'
gem 'asset_sync',           '~> 0.5.4'
gem 'bootstrap-sass',       '~> 2.3.1.0'
# gem 'carrierwave',          '~> 0.8.0'
# gem 'carmen-rails',        '~> 1.0.0'
# gem 'chosen-rails',        '~> 0.9.14'
gem 'dalli',                '~> 2.6.3'
gem 'devise',               '~> 3.0.0.rc'
gem 'filepicker-rails',     '~> 0.1'  # Not SemVer
gem 'high_voltage',         '~> 1.2.2'
# gem 'html5forms-rails',    '~> 0.1.4'
gem 'jbuilder',             '~> 1.0.1'
gem 'geocoder',             '~> 1.1.8'
gem 'memcachier',           '~> 0.0.2'
# gem 'modernizr-rails',     '~> 2.6.2'
gem 'newrelic_rpm',         '~> 3.6.2'
gem 'pg',                   '~> 0.15.1'
gem 'queue_classic',        '~> 2.1.4'
gem 'rack-canonical-host',  '~> 0.0.8'
gem 'simple_form',          '~> 3.0.0.rc'
# gem 'squeel',              '~> 1.0.18'
gem 'turbolinks',           '~> 1.1.1'
gem 'unicorn',              '~> 4.6.2'
# gem 'will_paginate',       '~> 3.0.4'

gem 'coffee-rails',    '~> 4.0.0'
gem 'jquery-rails',    '~> 2.2.1'
# gem 'jquery-ui-rails', '~> 4.0.2'
gem 'sass-rails',      '~> 4.0.0.rc1'
gem 'slim-rails',      '~> 1.1.1'
gem 'uglifier',        '>= 1.3.0'

gem 'tilt', '~> 1.3.7'     # Rails 4 wants a newer version of tilt than slim
gem 'json', '~> 1.7.0'  # Something isn't happy with Zeus get json 1.7

group :development do
  gem 'awesome_print'
  gem 'brakeman'
  gem 'bullet'
  gem 'foreman'
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-remote'
  gem 'pry-awesome_print'
  gem 'pry-doc'
  gem 'pry-debugger'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  gem 'switch_user'
  gem 'thin'
end

group :development, :test do
  gem 'dotenv-rails'
end

group :test do
  # gem 'capybara'
  # gem 'capybara-screenshot'
  # gem 'poltergeist'
  # gem 'simplecov', require: false
  # gem 'timecop'
end

group :qa, :staging, :production do
  # gem 'rack-mini-profiler' #NOTE: To use with heroku-deflator see: https://github.com/SamSaffron/MiniProfiler/issues/131
  gem 'heroku-deflater', '~> 0.5.1'  # Compress page content
end

group :tasks do
  gem 'snoo'
end

# group :doc do
#   # bundle exec rake doc:rails generates the API under doc/api.
#   gem 'sdoc', require: false
# end
