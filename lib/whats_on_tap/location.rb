class WhatsOnTap::Location
  @@locations = []

  attr_accessor :name, :address, :distance, :beer_list, :beers_on_tap, :establishment_type


  def self.scrape_locations #should probably be in scraper

    #stubbed data, need to actually scrape from site

    @doc = Nokogiri::HTML(open("https://www.beermenus.com/search?q=philadelphia"))
    places = @doc.css("h3.mb-0.text-normal a").text
    establishment_type = @doc.css("h3.mb-0.text-normal span").first.text
    num_beers_on_tap = @doc.css("p.caption.text-gray.mb-small").first.text
    binding.pry


    # location_1 = self.new
    # location_1.name = "Hop Angel Brauhaus"
    # location_1.address = "7980 Oxford Ave"
    # location_1.distance = "1.0 miles"
    # location_1.beer_list = ["Alpine Willy Wheat Ale", "Benediktiner Oktoberfest", "Bitburger Pilsner", "Blake's Black Philip Hard Cider",
    #   "Evil Genius Trick or Treat"]
    #
    # location_2 = self.new
    # location_2.name = "Grey Lodge Pub"
    # location_2.address = "6235 Frankford Ave"
    # location_2.distance = "2.7 miles"
    # location_2.beer_list = ["Allagash Black", "Alpine Truck Trail", "Anderson Valley Cerveza Crema Nitro", "Black Hog Strawberry Gose",
    #   "Green Flash Spanish Trampoline"]
    #
    # location_3 = self.new
    # location_3.name = "Daly's Irish Pub"
    # location_3.address = "4201 Comly Street"
    # location_3.distance = "2.9 miles"
    # location_3.beer_list = ["Shock Top Lemon Shandy", "Conshohocken Blood Money", "Downeast Cider Survivor Bob", "Magic Hat Elder Betty",
    #   "Yards Brawler"]
    #
    # [location_1, location_2, location_3]

  end

end
