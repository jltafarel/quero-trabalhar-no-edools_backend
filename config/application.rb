require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module QueroTrabalharNoEdoolsBackend
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller
    config.i18n.default_locale = 'pt-BR'
  end
end
