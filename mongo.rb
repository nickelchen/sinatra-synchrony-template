include Mongo

DB_CONFIG = YAML::load(File.open(settings.root + '/config/database.yml'))[ENV["RACK_ENV"]]

host = DB_CONFIG['host'] || 'localhost'
port = DB_CONFIG['port'] || 27017
db_name = DB_CONFIG['database']

mongo_client = MongoClient.new(host, port)
mongo_db     = mongo_client.db(db_name)
mongo_coll   = mongo_db.collection('operations')

configure do
  set :mongo_client, mongo_client
  set :mongo_db,     mongo_db
  set :mongo_coll,   mongo_coll
end