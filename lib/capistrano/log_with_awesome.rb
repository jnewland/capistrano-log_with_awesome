require 'capistrano'

module Capistrano
  class LogWithAwesome < Capistrano::Logger
    #replaces the built in Capistrano logger with awesome
    def self.init(config)
      @config = config
      level = @config.logger.level
      @config.logger = new
      @config.logger.level = level
    end

    def self.log_with_awesome(message)
      @buffer ||= []
      @buffer << message
      @config.set :message, message
      @config.set :full_log, @buffer.join("\n")
      @config.silently_trigger(:log_message)
    end

    # Log and do awesome things
    # I wish there was a nicer way to do this. Hax on device.puts, maybe?
    def log(level, message, line_prefix=nil)
      if level <= self.level
        indent = "%*s" % [Capistrano::Logger::MAX_LEVEL, "*" * (Capistrano::Logger::MAX_LEVEL - level)]
        (RUBY_VERSION >= "1.9" ? message.lines : message).each do |line|
          if line_prefix
            self.class.log_with_awesome "#{indent} [#{line_prefix}] #{line.strip}"
          else
            self.class.log_with_awesome "#{indent} #{line.strip}"
          end
        end
      end
      super(level, message, line_prefix)
    end
  end
end

module Capistrano
  class Configuration
    module Callbacks
      # Trigger the named event without logging.it
      def silently_trigger(event, task=nil)
        pending = Array(callbacks[event]).select { |c| c.applies_to?(task) }
        if pending.any?
          pending.each { |callback| callback.call }
        end
      end
    end
  end
end

# load last in order to repoen rather than define
require 'capistrano/log_with_awesome/version'

Capistrano::Configuration.instance.load do
  Capistrano::LogWithAwesome.init(self)
end
