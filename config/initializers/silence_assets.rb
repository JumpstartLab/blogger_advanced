class NullLogger < Logger
  def initialize(*args); end
  def write(*input); true; end
end

Rails.application.assets.logger = NullLogger.new

class Rails::Rack::Logger
  alias_method :standard_call, :call 

  def temporary_level(level)
    initial_level = Rails.logger.level
    Rails.logger.level = level
    yield
  ensure
    Rails.logger.level = initial_level
  end

  def call(env)
    if env['PATH_INFO'] =~ /^\/assets\//
      temporary_level(Logger::ERROR) { standard_call(env) }
    else
      standard_call(env)
    end
  end
end
