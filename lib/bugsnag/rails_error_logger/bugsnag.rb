require 'bugsnag'

module RailsErrorLogger
  class Bugsnag
    def write(message)
      if message[:options][:severity] >= Logger::ERROR
        message[:options][:severity] = 'error'
      elsif message[:options][:severity] >= Logger::WARN
        message[:options][:severity] = 'warning'
      else
        message[:options][:severity] = 'info'
      end

      ::Bugsnag.notify(message[:exception], message[:options])
    end
  end
end
