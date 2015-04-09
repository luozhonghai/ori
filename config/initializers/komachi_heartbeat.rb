Ori::Application.configure do

  config.heartbeat.application_version = "1.0.0"
  config.heartbeat.application_name = "Ori"
  config.heartbeat.database_class_names = %w(ActiveRecord::Base)
  config.heartbeat.db_check_enabled = true
  config.heartbeat.redis_check_enabled = true
  config.heartbeat.redis_servers = [{host: "localhost", port: 6379, db: 0}]
  #config.heartbeat.redis_servers = [Hase.config[:redis].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}]
  #config.heartbeat.memcached_check_enabled = true
  #config.heartbeat.memcached_server_names = Hase.config[:base][:memcache_hosts]

end
