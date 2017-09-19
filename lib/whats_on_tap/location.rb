#might not need to require anything here?

class WhatsOnTap::Location
  @@locations = []

  attr_accessor :name, :address, :distance, :beer_list

  def self.all
    #I should return a bunch of instances of locations
    puts <<-DOC
    1. Hop Angel Brauhaus - 1.0 miles away
    2. Grey Lodge Pub - 2.7 miles away
    3. Gat Beer - 2.7 miles away
    DOC
    location_1 = self.new
    location_1.name = "Hope Angel Brauhaus"
    location_1.address = "7980 Oxford Ave"
    location_1.distance = "2.0 miles"
    location_1.beer_list = ["Alpine Willy Wheat Ale", "Benediktiner Oktoberfest", "Bitburger Pilsner", "Blake's Black Philip Hard Cider", "Evil Genius Trick or Treat"]
  end

  def initialize

    @@locations << self
  end

end
