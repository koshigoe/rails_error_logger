require 'rails'
require 'rails_error_logger/logger'

module RailsErrorLogger
  class Railtie < Rails::Railtie
    initializer :add_bugsnag_logger, before: :load_config_initializers do
      error_logger = RailsErrorLogger::Logger.new(:bugsnag)
      error_logger.level = Logger::WARN
      Rails.logger.extend ActiveSupport::Logger.broadcast(error_logger)
    end
  end
end
