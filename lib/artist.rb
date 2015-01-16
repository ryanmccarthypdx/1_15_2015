class Artist
  attr_reader(:artist, :members)

  define_method(:initialize) do |attributes|
    @artist = attributes.fetch(:artist)
    @members = attributes.fetch(:members)
  end

  
end
