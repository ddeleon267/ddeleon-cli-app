class WhatsOnTap::Location

  attr_accessor :name, :address, :distance, :beer_list, :beers_on_tap, :establishment_type

  @@all = []



  def initialize(name=nil)
    #, establishment_type=nil, beers_on_tap=nil
    @name = name
    # @establishment_type = establishment_type
    # @beers_on_tap =
    @@all << self
  end

  def self.all
    @@all
  end

end
