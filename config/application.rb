require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
# require 'active_storage/engine'
# require "action_mailer/railtie"
# require 'action_mailbox/engine'
# require "action_text/engine"
require 'action_view/railtie'
# require "action_cable/engine"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gamification2
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :delayed_job
    config.organisations = %w[ZeusWPI 12urenloop]
    config.repo_name_deny_list = %w[
      Bestuurstaakjes
      NodePizza2019
      SumoRoboComp
      VPW-voorbereiding-2014
      VPW-voorbereiding-2015
      contests
      cvc
      errbit
      glowing-octo-dubstep
      kaggle-rta
      manage-user
      website-manage
    ]
  end
end
