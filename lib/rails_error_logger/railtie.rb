require 'rails'
require 'rails_error_logger/logger'

module RailsErrorLogger
  class Railtie < Rails::Railtie
    config.error_logger = ActiveSupport::OrderedOptions.new
    config.error_logger.log_device = :bugsnag
    config.error_logger.log_level = Logger::ERROR

    initializer :add_error_logger, before: :load_config_initializers do
      error_logger = RailsErrorLogger::Logger.new(config.error_logger.log_device)
      error_logger.level = config.error_logger.log_level
      Rails.logger.extend ActiveSupport::Logger.broadcast(error_logger)
    end
  end
end
