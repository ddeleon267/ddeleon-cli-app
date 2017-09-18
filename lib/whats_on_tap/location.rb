class WhatsOnTap::Location
  @@locations = []

  attr_accessor :name, :location, :distance, :beer_list

  def self.all
    #I should return a bunch of instances of locations
  end

  def initialize

    @@locations << self
  end

end
