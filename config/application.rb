require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

config.assets.initialize_on_precompile = false

module SampleApp
  class Application < Rails::Application
    config.load_defaults 5.1
  end
end
