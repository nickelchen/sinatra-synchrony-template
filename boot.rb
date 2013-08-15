require 'rubygems'

# Set rack environment
ENV['RACK_ENV'] ||= "development"

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, ENV['RACK_ENV'])

if development? or test?
  require 'sinatra/reloader' 
  #controllers file
  Dir.glob(File.join(settings.root, "controllers") + '/**/*.rb').each do |file|
    also_reload file
  end
end



# Set project configuration
require File.expand_path("../application", __FILE__)
