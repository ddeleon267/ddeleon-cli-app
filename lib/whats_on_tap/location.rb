class WhatsOnTap::Location

  attr_accessor :name, :address, :distance, :beer_list, :num_beers_on_tap, :establishment_type

  @@all = []

  def initialize(name=nil, establishment_type=nil, beers_on_tap=nil)
    #take away second two default arguments??
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

end
