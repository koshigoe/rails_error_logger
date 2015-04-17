require 'active_support/logger'
require 'bugsnag/rails_error_logger/bugsnag'

module RailsErrorLogger
  class Logger < ActiveSupport::Logger
    def initialize(*args)
      @progname = nil
      @level = ERROR
      @default_formatter = proc do |severity, datetime, progname, msg|
        {
          exception: RuntimeError.new(msg),
          options: {
            severity: SEV_LABEL.index(severity)
          }
        }
      end
      @formatter = nil
      @logdev = "RailsErrorLogger::#{args.first.to_s.camelize}".constantize.new
    end
  end
end
