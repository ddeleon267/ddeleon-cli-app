#might not need to require anything here?

class Beer
  attr_accessor :name, :type, :notes, :alcohol_percentage, :price

  @beers = []

  def self.all
    #I should return a bunch of instances of beers
    self.scrape_beers
  end
end
