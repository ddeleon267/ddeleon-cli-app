class WhatsOnTap::Scraper

  def self.get_beer_menu_site(city)
    @@page = Nokogiri::HTML(open("https://www.beermenus.com/search?q=#{city}"))
  end

  def self.page
    @@page
  end

  def self.make_locations
    self.scrape_location_urls
    self.scrape_location_names.each.with_index(1) do |location_name,i|
      location_object = WhatsOnTap::Location.new(location_name)
      location_object.establishment_type = self.scrape_establishment_types[i-1]
      location_object.num_beers_on_tap = self.scrape_num_beers_on_tap[i-1]
    end
  end

################### helper methods for #make_locations ###################################
  def self.scrape_location_urls
    url = self.page.css("h3.mb-0.text-normal a").take(5).map { |link| link['href']}
  end

  def self.scrape_location_names
    locations = self.page.css("h3.mb-0.text-normal a").take(5).map {|p| p.text}
  end

  def self.scrape_establishment_types
    establishment_type = self.page.css("h3.mb-0.text-normal span").take(6).map {|p| p.text.gsub("· ", "")}
  end

  def self.scrape_num_beers_on_tap
    num_beers_on_tap = self.page.css("p.caption.text-gray.mb-small").take(6).map {|p| p.text}
  end
  #########################################################################################


  def self.get_beer_list_page(place)
    modified_page_url = "https://www.beermenus.com#{self.scrape_location_urls[place]}"
    @@beer_list_page = Nokogiri::HTML(open(modified_page_url))
  end

  def self.beer_list_page
    @@beer_list_page
  end


  #########################################################################################
  def self.make_beers
    self.scrape_beer_names.each.with_index(1) do |beer_name,i|
      beer_object = WhatsOnTap::Beer.new(beer_name)
    end
  end

  #helper methods for #make_beers
  def self.scrape_beer_names
    beer_list = self.beer_list_page.css("h3.mb-0.text-normal a").take(10).map {|p| p.text}
  end
#######################################################################################


  def self.get_beer_info_page(beer)
    modified_page_url = "https://www.beermenus.com#{self.scrape_beer_urls[beer]}"
    @@beer_page = Nokogiri::HTML(open(modified_page_url))
  end

  def self.beer_page
    @@beer_page
  end

# helper methods for #get_beer_info_page
  def self.scrape_beer_urls
    self.beer_list_page.css("h3.mb-0.text-normal a").take(5).map { |link| link['href']}
  end


#######################################################################################

##need to work on this
  def self.scrape_individual_beer_data
      brewery = self.beer_page.css("div.pure-f-body a").text
      brewery_location = self.beer_page.css("p.mt-tiny.mb-0").text
      type_and_abv = self.beer_page.css("li.caption.lead-by-icon p")[1].text.gsub("\n","").strip.split("·")
      type = type_and_abv[0].strip
      abv = type_and_abv[1].strip

      notes = self.beer_page.css("div.caption p")[0].text
      description = self.beer_page.css("div.caption.beer-desc p").text

      full_description = notes+description

     [brewery, brewery_location, type, abv, full_description]

  end

end
