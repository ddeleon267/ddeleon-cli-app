class WhatsOnTap::Location
  attr_accessor :name, :num_beers_on_tap, :type
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end
