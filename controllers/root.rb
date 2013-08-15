


# #web api

# get '/post/:id' do
#   content_type :json
#   p = Post.find params[:id]
#   Post.find_by_sql "SELECT SLEEP(1)"
#   p.to_json
# end

# get '/example.json' do
#   content_type :json
#   { :key1 => '<html>value1</html>', :key2 => 'value2' }.to_json
# end

# get '/facebook' do
#   conn = Faraday.new(:url => 'https://www.facebook.com') do |faraday|
#     faraday.request  :url_encoded             # form-encode POST params
#     faraday.response :logger                  # log requests to STDOUT
#     # faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
#     faraday.adapter  :em_synchrony            # fiber aware http client
#   end
#   response = conn.get do |request|
#     request.url "/"
#   end
#   puts response.body
# end





# #website

# before '/secure/*' do
#   unless User.current
#     flash['alert alert-error'] = 'Sorry guacamole, you need to be logged in to visit ' + request.path
#     halt haml(:login)
#   end
# end

# get '/' do
#   haml :index
# end

# get '/register' do
#   haml :register
# end
# post '/register' do
#   register_user
# end

# get '/login' do 
#   haml :login
# end
# post '/login' do
#   authenticate_user
# end

# get '/logout' do
#   self.logged_user = nil
#   haml "%div.alert.alert-message 'Logged out'"
# end


# get '/secure/place' do
#   haml "This is a secret place that only #{ User.current.name } has access to!"
# end


# def register_user
#   name = params[:name]
#   pass = params[:password]
#   password_confirm = params[:password_confirm]
#   if pass != password_confirm
#     flash['alert alert-error'] = 'password not confirmed'
#     return nil
#   end
#   if User.find_by_name(name)
#     flash['alert alert-error'] = 'username is registerred'
#     return nil
#   end
#   user = User.new
#   user.name = name
#   user.salt_password(pass)
#   if user.save
#     flash['alert alert-notice'] = 'successfully registerred'
#     redirect to '/'
#   else
#     haml :register, :locals => { :user => user }
#   end
# end

# def authenticate_user
#   user = User.try_to_login(params[:name], params[:password])
#   if user.nil?
#     invalid_credentials
#   else
#     self.logged_user = user
#     successful_authentication
#   end
# end
# def invalid_credentials
#   flash['alert alert-error'] = 'name or password error'
#   redirect to '/login'
# end
# def successful_authentication
#   flash['alert alert-notice'] = 'login successful'
#   redirect to '/'
# end

# def logged_user=(user)
#   reset_user_session
#   if user
#     User.current = user
#     start_user_session user
#   else
#     User.current = nil
#   end
# end

# def reset_user_session
#   session.delete :user_id
#   session.delete :create_time
#   session.delete :active_time
# end

# def start_user_session(user)
#   session[:user_id] = user.id
#   session[:create_time] = Time.now.utc.to_i
#   session[:active_time] = Time.now.utc.to_i
# end

# def session_expired?
#   false
# end