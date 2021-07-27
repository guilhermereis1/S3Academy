require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module SchoolVideos
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.default_locale = :"pt-BR"
  end
end
