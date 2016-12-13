require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Movements
  class Application < Rails::Application
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.jbuilder false
      generate.test_framework :rspec
      # generate.test_framework :rspec, view_specs: false, controller_specs: false, helper_specs: false, routing_specs: false, request_specs: false
    end
  end
end
