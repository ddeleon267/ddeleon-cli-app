class WhatsOnTap::Location
  @@locations = []

  attr_accessor :name, :address, :distance, :beer_list, :beers_on_tap, :establishment_type


  # def self.scrape_locations #should probably be in scraper
  #
  #   #stubbed data, need to actually scrape from site
  #
  #   @doc = Nokogiri::HTML(open("https://www.beermenus.com/search?q=philadelphia"))
  #   places = @doc.css("h3.mb-0.text-normal a").text
  #
  #   #So a lot of this formatting is particular to the philadelphia list and will need to change when
  #   #the gem actually responds to the city input (rather than just defaulting to philly data)
  #   new_string = places.gsub(/phia/, "phia, ").gsub(/PHIA/, "PHIA, ").split(",").first(10)
  #   new_string[8][6]=""
  #   new_string[9][1]=""
  #   new_string
  #
  #
  #   # establishment_type = @doc.css("h3.mb-0.text-normal span").first.text
  #   # num_beers_on_tap = @doc.css("p.caption.text-gray.mb-small").first.text
  #   # binding.pry
  #
  # end

end
