require('rspec')
require('collection')
require('pry')
require('artist')


describe(CD) do

before() do
  CD.clear()
end


  describe("#artist") do
    it("Returns the artist for a given CD object") do
      test_cd = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      expect(test_cd.artist()).to(eq("Bob Dylan"))
    end
  end

  describe('#save') do
    it("Saves a CD object into the all_CDs set") do
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => "Bob Dylan", :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.all()).to(eq([test_cd1, test_cd2]))
    end
  end

  # describe('.clear')

  describe('.search') do
    it("Returns the CD object when you search via album name") do
      test_artist = Artist.new({ :artist => "Bob Dylan", :members => "Bob Dylan"})
      test_cd1 = CD.new({ :artist => test_artist, :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => test_artist, :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.search("Highway 61")).to(eq([test_cd2]))
    end

    it("Returns an empty array when you search for something you don't have") do
      test_artist = Artist.new({ :artist => "Bob Dylan", :members => "Bob Dylan"})
      test_cd1 = CD.new({ :artist => test_artist, :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => test_artist, :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.search("Doggystyle")).to(eq([]))
    end

    it("Returns multiple instances of CDs when you search by artist") do
      test_artist = Artist.new({ :artist => "Bob Dylan", :members => "Robert Zimmerman"})
      test_cd1 = CD.new({ :artist => test_artist, :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => test_artist, :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.search("Bob Dylan")).to(eq([test_cd1, test_cd2]))
    end

    it("Returns multiple instances of CDs when you search by album") do
      test_artist = Artist.new({ :artist => "Bob Dylan", :members => "Bob Dylan"})
      test_cd1 = CD.new({ :artist => test_artist, :album => "Live" })
      test_artist2 = Artist.new({ :artist => "The Dogg Pound", :members => ["Snoop Doggy Dogg", "Warren G", "Nate Dogg"]})
      test_cd2 = CD.new({ :artist => test_artist2, :album => "Live" })
      test_artist3 = Artist.new({ :artist => "Live", :members => ["Neil Young", "Some Douchebag"] })
      test_cd3 = CD.new({ :artist => test_artist3, :album => "Shitty 90s Alt Rock" })
      test_artist4 = Artist.new({ :artist => "CSNY", :members => ["Neil Young", "Crosby", "Stills", "Nash"] })
      test_cd4 = CD.new({ :artist => test_artist4, :album => "Droppin LSD in the 60s" })
      test_cd1.save()
      test_cd2.save()
      test_cd3.save()
      test_cd4.save()
      expect(CD.search("Live")).to(eq([test_cd1, test_cd2, test_cd3]))
    end

    it("Returns multiple instances of CDs when you search by someone who was a member of multiple bands") do
      test_artist = Artist.new({ :artist => "Bob Dylan", :members => "Bob Dylan"})
      test_cd1 = CD.new({ :artist => test_artist, :album => "Live" })
      test_artist2 = Artist.new({ :artist => "The Dogg Pound", :members => ["Snoop Doggy Dogg", "Warren G", "Nate Dogg"]})
      test_cd2 = CD.new({ :artist => test_artist2, :album => "Live" })
      test_artist3 = Artist.new({ :artist => "Live", :members => ["Neil Young", "Some Douchebag"] })
      test_cd3 = CD.new({ :artist => test_artist3, :album => "Shitty 90s Alt Rock" })
      test_artist4 = Artist.new({ :artist => "CSNY", :members => ["Neil Young", "Crosby", "Stills", "Nash"] })
      test_cd4 = CD.new({ :artist => test_artist4, :album => "Droppin LSD in the 60s" })
      test_cd1.save()
      test_cd2.save()
      test_cd3.save()
      test_cd4.save()
      expect(CD.search("Neil Young")).to(eq([test_cd3, test_cd4]))
    end

  end

  describe('.select') do
    it("returns nothing if you select an ID that doesn't exist") do
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => "Bob Dylan", :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.select(3)).to(eq(nil))
    end

    it("returns the correct CD object") do
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => "Bob Dylan", :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.select(1)).to(eq(test_cd1))
    end
  end
end



describe(Artist) do

  describe('#artist') do
    it('returns the band/artist name') do
      test_artist = Artist.new({ :artist => "CSNY", :members => ["Crosby", "Stills", "Nash", "Neil Young"] })
      expect(test_artist.artist()).to(eq("CSNY"))
    end
  end

  describe('#members') do
    it('returns the band/artist name') do
      test_artist = Artist.new({ :artist => "CSNY", :members => ["Crosby", "Stills", "Nash", "Neil Young"] })
      expect(test_artist.members()).to(eq(["Crosby", "Stills", "Nash", "Neil Young"]))
    end
  end

end
