class WhatsOnTap::Scraper

  def self.get_beer_menu_site(city)
    @@page = Nokogiri::HTML(open("https://www.beermenus.com/search?q=#{city}"))
  end

  def self.page
    @@page
  end

  def self.make_locations
    self.scrape_location_urls
    WhatsOnTap::Location.reset ##this is what enoch asked for, to keep from having
    #duplicates
    self.scrape_location_names.each.with_index do |location_name,i|
      location_object = WhatsOnTap::Location.new(location_name)
      location_object.establishment_type = self.scrape_establishment_types[i]
      location_object.num_beers_on_tap = self.scrape_num_beers_on_tap[i]
    end
  end

################### helper methods for #make_locations ###################################
  def self.scrape_location_urls
    self.page.css("h3.mb-0.text-normal a").take(5).map { |link| link['href']}
  end

  def self.scrape_location_names
    self.page.css("h3.mb-0.text-normal a").take(5).map {|p| p.text}
  end

  def self.scrape_establishment_types
    self.page.css("h3.mb-0.text-normal span").take(6).map {|p| p.text.gsub("· ", "")}
  end

  def self.scrape_num_beers_on_tap
    self.page.css("p.caption.text-gray.mb-small").take(6).map {|p| p.text}
  end
  #########################################################################################


  def self.get_beer_list_page(location_number)
    modified_page_url = "https://www.beermenus.com#{self.scrape_location_urls[location_number]}"
    @@beer_list_page = Nokogiri::HTML(open(modified_page_url))
  end

  def self.beer_list_page
    @@beer_list_page
  end


  #########################################################################################
  def self.make_beers
    WhatsOnTap::Beer.reset ##
    self.scrape_beer_names.each do |beer_name|
      WhatsOnTap::Beer.new(beer_name)
    end
  end

  #helper methods for #make_beers
  def self.scrape_beer_names
    self.beer_list_page.css("h3.mb-0.text-normal a").take(10).map {|p| p.text}
  end
#######################################################################################


  def self.get_beer_info_page(beer_number)
    modified_page_url = "https://www.beermenus.com#{self.scrape_beer_urls[beer_number]}"
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

  def self.get_and_set_beer_attributes(beer_number)
    #getting
    beer_attribute_array = self.scrape_individual_beer_data

    #setting   ----> this is not ideal... what else to do???
    beer_object = WhatsOnTap::Beer.all[beer_number]
    beer_object.brewery = beer_attribute_array[0]
    beer_object.brewery_location = beer_attribute_array[1]
    beer_object.type = beer_attribute_array[2]
    beer_object.abv = beer_attribute_array[3]
    beer_object.full_description = beer_attribute_array[4]

  end

  #and this?
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
