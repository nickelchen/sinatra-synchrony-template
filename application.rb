
configure do
  # = Configuration =
  set :run,             false
  set :show_exceptions, development?
  set :raise_errors,    development?
  set :logging,         true
  set :static,          development?
  set :public_folder, Proc.new { File.join(root, "static") }

  use Rack::Session::Cookie, :key => 'tool_information_sssion',
                           :path => '/',
                           :expire_after => 2592000, # In seconds
                           :secret => Time.now.utc.to_s + 'tool_information_sssion'
end

configure :production do
end

# initialize log
require 'logger'
Dir.mkdir('log') unless File.exist?('log')
class ::Logger; alias_method :write, :<<; end
case ENV["RACK_ENV"]
when "production"
  logger = ::Logger.new("log/production.log")
  logger.level = ::Logger::WARN
when "development"
  logger = ::Logger.new(STDOUT)
  logger.level = ::Logger::DEBUG
else
  # logger = ::Logger.new("/dev/null")
  logger = ::Logger.new(STDOUT)
  logger.level = ::Logger::DEBUG
end
use Rack::CommonLogger, logger


# initialize json
# ActiveSupport::JSON::Encoding.escape_html_entities_in_json = true

# load project config
APP_CONFIG = YAML.load_file(File.expand_path("../config", __FILE__) + '/app_config.yml')[ENV["RACK_ENV"]]

# initialize redis cache
# CACHE = ActiveSupport::Cache::DalliStore.new("127.0.0.1")
CACHE = EventMachine::Synchrony::ConnectionPool.new(size: 100) do
  ActiveSupport::Cache.lookup_store :redis_store, { :host => "localhost", :port => "6379", :driver => :synchrony, :expires_in => 1.week }
end
CACHE.logger = logger

# initialize ActiveRecord Cache
SecondLevelCache.configure do |config|
  config.cache_store = CACHE
  config.logger = logger
  config.cache_key_prefix = 'domain'
end

# autoload directory
%w{models lib}.each do |dir|
  ActiveSupport::Dependencies.autoload_paths << File.join(settings.root, "#{dir}")
end

#controllers file
Dir.glob(File.join(settings.root, "controllers") + '/**/*.rb').each do |file|
  require file
end