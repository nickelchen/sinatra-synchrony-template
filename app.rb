# 使用 em-mongo 
#
# 启动方法:
# ruby app.rb


# Set application dependencies
require File.expand_path("../boot", __FILE__)

EventMachine.synchrony do 
  
  require File.expand_path("../em-mongo", __FILE__)

  # Boot application
  Sinatra::Application.run!

end