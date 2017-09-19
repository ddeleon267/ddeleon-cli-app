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
    location_1.distance = "1.0 miles"
    location_1.beer_list = ["Alpine Willy Wheat Ale", "Benediktiner Oktoberfest", "Bitburger Pilsner", "Blake's Black Philip Hard Cider",
      "Evil Genius Trick or Treat"]

      location_2 = self.new
      location_2.name = "Grey Lodge Pub"
      location_2.address = "6235 Frankford Ave"
      location_2.distance = "2.7 miles"
      location_2.beer_list = ["Allagash Black", "Alpine Truck Trail", "Anderson Valley Cerveza Crema Nitro", "Black Hog Strawberry Gose",
        "Green Flash Spanish Trampoline"]


  end

  def initialize

    @@locations << self
  end

end
