get '/webapi/download_upgrade_pkg' do
  mongo_coll.insert({:name => 'nickelchen', :age => 100})
  "in webapi download_upgrade_pkg\r\n"
end
