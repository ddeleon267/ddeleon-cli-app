#might not need to require anything here?

class WhatsOnTap::Location
  @@locations = []

  attr_accessor :name, :address, :distance, :beer_list

  def self.all
    #I should return a bunch of instances of locations
    self.scrape_locations
  end

  def self.scrape_locations
    #person is prompted to give zip code
    #magic scraping voodo happens
    #Produce list of scraped locations
    #Prompt user to give number
    #Scrape beer list of chosen input using magic voodo
    #prompt to learn more about specific beer or w.e.
    #scrape video to give more info about beer or go back and do something else

    #will have to comment most/all fo what's below once I get scraping successfully
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

    location_3 = self.new
    location_3.name = "Daly's Irish Pub"
    location_3.address = "4201 Comly Street"
    location_3.distance = "2.9 miles"
    location_3.beer_list = ["Shock Top Lemon Shandy", "Conshohocken Blood Money", "Downeast Cider Survivor Bob", "Magic Hat Elder Betty",
      "Yards Brawler"]

    [location_1, location_2, location_3]

  end

  def initialize

  #
  end

end
