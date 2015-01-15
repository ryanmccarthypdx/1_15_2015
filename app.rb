require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/collection')

get("/cds") do
  @title = "My CD Collection"

  erb(:cd_main)
end


post("/cd_post") do
  @artist = params.fetch("artist")
  @album = params.fetch("album")
  new_cd = CD.new({ :artist => @artist, :album => @album })
  new_cd.save()
  @id = new_cd.id()

  @list = CD.all()

  erb(:cd_main)
end

get("/cd_search") do
  @search_results = CD.search(params.fetch("search_term"))
  erb(:cd_main)
end

get("/cd_select/:selection") do
  @selection = params.fetch("selection")
  erb(:cd_info)
end
