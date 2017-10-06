class WhatsOnTap::Location

  attr_accessor :name, :address, :distance, :beer_list, :num_beers_on_tap, :establishment_type

  @@all = []



  def initialize(name=nil, establishment_type=nil, beers_on_tap=nil)
    @name = name

    @@all << self
  end

  # @establishment_type = establishment_type
  # @beers_on_tap = beers_on_tap

  def self.set_establishment_type
    self.all.each_with_index do |object,i|
      #how to set these other attributes???
      object.establishment_type = WhatsOnTap::Scraper.scrape_establishment_type[i]
      end

    # binding.pry
  end


  def self.all
    @@all
  end

end
