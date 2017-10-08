#might not need to require anything here?

class WhatsOnTap::Beer
  attr_accessor :name, :brewery, :brewery_location, :type, :abv,
  :notes, :description

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


end
