# Set application dependencies
require File.expand_path("../boot", __FILE__)


# 使用普通的　mongo
# 
require File.expand_path("../mongo", __FILE__)

# Boot application
run Sinatra::Application
