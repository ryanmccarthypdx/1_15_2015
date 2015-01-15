require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/collection')
require('pry')


get("/cds") do
  @title = "My CD Collection"
  @list = CD.all()
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

# get("/cd_post") do
#   @list = CD.all()
#   erb(:cd_main)
# end

get("/cd_select/:selection") do
  @selected = CD.select(params.fetch("selection").to_i())
  @artist = @selected.artist()
  @album = @selected.album()
  erb(:cd_info)
end


get("/cd_results") do
  @search_results = CD.search(params.fetch("search_term"))
  @search_results.each() do |result|
    @result_artist = @result.artist()
    @result_album = @result.album()
  end
  erb(:cd_results)
end
