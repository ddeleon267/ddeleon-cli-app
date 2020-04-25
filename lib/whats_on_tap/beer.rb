class WhatsOnTap::Beer
  attr_accessor :name, :brewery, :brewery_location, :type, :abv, :full_description
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    self.all.find {|beer| beer.name == name}
  end

  def self.create_by_name(name)
    location = self.new(name)
    location.save
    location
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
end
