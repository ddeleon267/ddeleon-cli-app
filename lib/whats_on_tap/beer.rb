class WhatsOnTap::Beer
  attr_accessor :name, :brewery, :brewery_location, :type, :abv, :full_description, :location, :url
  @@all = []

  def initialize(name:) # maybe add location here
    @name = name
    #@location = location
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|beer| beer.name == name}
  end

  def self.select_by_location(location)
    self.all.select {|beer| beer.location == location}
  end

end
