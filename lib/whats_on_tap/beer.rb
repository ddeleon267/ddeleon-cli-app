#might not need to require anything here?

class WhatsOnTap::Beer
  attr_accessor :name, :brewery, :brewery_location, :type, :abv, :notes, :description, :price

  @@beers = []

  def initialize(name)
    @name = name
    @@beers << self
  end


end
