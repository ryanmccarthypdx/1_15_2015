require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/collection')
require('pry')
require('./lib/artist')


get("/cds") do
  @title = "My CD Collection"
  @list = CD.all()
  erb(:cd_main)
end

post("/cd_post") do
  @band_name = params.fetch("artist")
  @band_members = (params.fetch("members")).split(", ")
  @artist = Artist.new({ :artist => @band_name, :members => @band_members })
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
  @members = @selected.artist().members().join(", ").to_s()
  @album = @selected.album()
  erb(:cd_info)
end


get("/cd_results") do
  @search_results = CD.search(params.fetch("search_term"))

  # @search_results.each() do |result|
  #   @result_artist = @result.artist()
  #   @result_album = @result.album()
  # end
  erb(:cd_results)
end
