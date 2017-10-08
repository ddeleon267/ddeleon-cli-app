class WhatsOnTap::Scraper

  #accessing beer menus page for a city based on input
  def self.get_beer_menu_page(city)
    @@page = Nokogiri::HTML(open("https://www.beermenus.com/search?q=#{city}"))
  end

  def self.page
    @@page
  end
  #scraping for locations for ^^^
  def self.scrape_locations
    locations = self.page.css("h3.mb-0.text-normal a").take(5).map {|p| p.text}
  end

  def self.scrape_establishment_type
    establishment_type = self.page.css("h3.mb-0.text-normal span").take(6).map {|p| p.text.gsub("· ", "")}
  end

  def self.scrape_num_beers_on_tap
    num_beers_on_tap = self.page.css("p.caption.text-gray.mb-small").take(6).map {|p| p.text}
  end

  #---------------------------

  #scrape for url... should I just make this a location attribute???
  def self.scrape_location_url #######
    url = self.page.css("h3.mb-0.text-normal a").take(5).map { |link| link['href']}
  end

  #accesses a location's page from ^^^
  def self.get_beer_list_page(place)
    modified_url = "https://www.beermenus.com#{self.scrape_location_url[place]}"
    @@beers_page = Nokogiri::HTML(open(modified_url))
  end

  def self.scrape_beers
    beer_list = self.beers_page.css("h3.mb-0.text-normal a").take(10).map {|p| p.text}
    # binding.pry
  end

  def self.beers_page
    @@beers_page
  end
  #---------------------------
  #accesses an individual beer's page
  def self.scrape_beer_url
    beer_url = self.beers_page.css("h3.mb-0.text-normal a").take(5).map { |link| link['href']}
  end

  def self.get_beer_data_page(beer)
    #maybe the problem is here???
    modified_beer_url = "https://www.beermenus.com#{self.scrape_beer_url[beer]}"
    @@beer_page = Nokogiri::HTML(open(modified_beer_url))
  end

  def self.beer_page
    @@beer_page
  end

  def self.scrape_individual_beer_data
      brewery = self.beer_page.css("div.pure-f-body a").text #good
      brewery_location = self.beer_page.css("p.mt-tiny.mb-0").text #good
      type_and_abv = self.beer_page.css("li.caption.lead-by-icon p")[1].text.gsub("\n","").strip.split("·")
      type = type_and_abv[0].strip
      abv = type_and_abv[1].strip

      notes = self.beer_page.css("div.caption p")[0].text #good
      description = self.beer_page.css("div.caption.beer-desc p").text

     [brewery, brewery_location, type, abv, notes, description]



  end

end
