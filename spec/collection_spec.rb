require('rspec')
require('collection')
require('pry')


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
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => "Bob Dylan", :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.search("Highway 61")).to(eq([test_cd2]))
    end

    it("Returns an empty array when you search for something you don't have") do
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => "Bob Dylan", :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.search("Doggystyle")).to(eq([]))
    end

    it("Returns multiple instances of CDs when you search by artist") do
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => "Bob Dylan", :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.search("Bob Dylan")).to(eq([test_cd1, test_cd2]))
    end

    it("Returns multiple instances of CDs when you search by album") do
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Live" })
      test_cd2 = CD.new({ :artist => "Snoop Doggy Dogg", :album => "Live" })
      test_cd3 = CD.new({ :artist => "Live", :album => "Shitty 90s Alt Rock" })
      test_cd1.save()
      test_cd2.save()
      test_cd3.save()
      expect(CD.search("Live")).to(eq([test_cd1, test_cd2, test_cd3]))
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

    it("returns nothing if you select an ID that doesn't exist") do
      test_cd1 = CD.new({ :artist => "Bob Dylan", :album => "Basement Tapes" })
      test_cd2 = CD.new({ :artist => "Bob Dylan", :album => "Highway 61" })
      test_cd1.save()
      test_cd2.save()
      expect(CD.select(1)).to(eq(test_cd1))
    end


  end






end
