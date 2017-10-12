class WhatsOnTap::Beer
  attr_accessor :name, :brewery, :brewery_location, :type, :abv, :notes, :full_description

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all.uniq
  end

  def self.reset
    @@all.clear
  end

end
