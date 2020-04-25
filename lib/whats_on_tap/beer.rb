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


  def self.find_by_name(name)
    self.all.find {|beer| beer.name == name}
  end



end
