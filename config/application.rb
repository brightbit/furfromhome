require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Furfromhome
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Raise errors when an unpermitted param is sent to a controller action
    # config.action_controller.action_on_unpermitted_parameters = :raise #FIXME: Add me back security yo

    # Set the filerpicker.io api key
    config.filepicker_rails.api_key = ENV['FILEPICKER_API_KEY']

    # Load fonts into the asset pipeline
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
  end
end
