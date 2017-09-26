#might not need to require anything here?

class Beer
  attr_accessor :name, :style, :notes, :abv, :price

  @beers = []

  def self.all
    #I should return a bunch of instances of beers
    self.scrape_beers
  end

  def self.scrape_beers
    beer_1 = self.new
    beer_1.style = "Elderberry Weiss"
    beer_1.notes = ["2-row pale, wheat malts, Apollo hops, elderberry"]
    beer_1.abv = "5.5%"
    beer_1.price = ""

  end
end
