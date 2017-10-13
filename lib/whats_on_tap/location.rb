class WhatsOnTap::Location
  attr_accessor :name, :address, :distance, :beer_list, :num_beers_on_tap, :establishment_type, :url
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset
    @@all.clear
  end
end
