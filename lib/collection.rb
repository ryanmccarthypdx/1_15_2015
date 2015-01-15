class CD
  attr_reader(:artist, :album)

  @@all_CDs = []

  define_method(:initialize) do |attribute|
    @artist = attribute.fetch(:artist)
    @album = attribute.fetch(:album)
  end

  define_method(:save) do
    @@all_CDs.push(self)
  end

  define_singleton_method(:all) do
    @@all_CDs
  end

  define_singleton_method(:search) do |search_term|
    output_array = []
    @@all_CDs.each() do |cd|
      if cd.artist().==(search_term) || cd.album().==(search_term)
        output_array.push(cd)
      end
    end
    output_array
  end

  define_singleton_method(:clear) do
    @@all_CDs = []
  end






end
