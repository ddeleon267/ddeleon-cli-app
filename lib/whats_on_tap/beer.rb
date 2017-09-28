#might not need to require anything here?

class Beer
  attr_accessor :name, :style, :notes, :abv, :price

  @beers = []

  def initialize(name)
    @name = name
  end

  def self.all
    #I should return a bunch of instances of beers
    self.scrape_beers
  end

  def self.scrape_beers
    beer_1 = self.new("Magic Hat Elder Betty")
    beer_1.style = "Elderberry Weiss"
    beer_1.notes = ["2-row pale, wheat malts, Apollo hops, elderberry"]
    beer_1.abv = "5.5%"
    beer_1.price = ""

    beer_2 = self.new("Magic Hat Elder Betty2")
    beer_2.style = "Elderberry Weiss"
    beer_2.notes = ["2-row pale, wheat malts, Apollo hops, elderberry"]
    beer_2.abv = "5.5%"
    beer_2.price = ""

    beer_3 = self.new("Magic Hat Elder Betty3")
    beer_3.style = "Elderberry Weiss"
    beer_3.notes = ["2-row pale, wheat malts, Apollo hops, elderberry"]
    beer_3.abv = "5.5%"
    beer_3.price = ""

    [beer_1, beer_2, beer_3]
  end
end
