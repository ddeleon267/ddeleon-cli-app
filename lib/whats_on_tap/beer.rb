#might not need to require anything here?

class WhatsOnTap::Beer
  attr_accessor :name, :style, :notes, :abv, :price

  @@beers = []

  def initialize(name)
    @name = name
    @@beers << self
  end


end
