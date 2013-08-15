#encoding: utf-8

before do
  response['X-UA-Compatible'] = "IE=edge,chrome=1"
end

before do
  pass if ENV["RACK_ENV"] == 'production'
  ActiveSupport::Dependencies.clear

  Dir.glob(File.join(settings.root, "controllers") + '/**/*.rb').each do |file|
    require file
  end
end
