class WhatsOnTap::Location
  attr_accessor :name, :num_beers_on_tap, :type, :city, :beers, :url

  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @beers = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|location| location.name == name}
  end

  def self.select_by_city(city)
    self.all.select {|location| location.city == city}
  end

end
