class WhatsOnTap::Scraper


  def self.get_beer_menu_page(city)
    @@page = Nokogiri::HTML(open("https://www.beermenus.com/search?q=#{city}"))
    #this will need to be modified based on the city the user gives
  end

  def self.page
    @@page
  end

  def self.scrape_locations
    locations = self.page.css("h3.mb-0.text-normal a").map {|p| p.text}
    binding.pry

    #So a lot of this formatting is particular to the philadelphia list and will need to change when
    #the gem actually responds to the city input (rather than just defaulting to philly data)

    # new_string = locations.gsub(/phia/, "phia, ").gsub(/PHIA/, "PHIA, ").split(",").first(10)
    # new_string[8][6]=""
    # new_string[9][1]=""
    # new_string
  end

  def self.scrape_establishment_type
    establishment_type = self.page.css("h3.mb-0.text-normal span").text
    # establishment_array = establishment_type.split("·")
    # establishment_array.delete_at(0)
    # establishment_array
  end

  def self.scrape_num_beers_on_tap
    num_beers_on_tap = self.page.css("p.caption.text-gray.mb-small").text

    # num_beers_array = num_beers_on_tap.split("O").map do |e|
    #   e.insert(0, 'O').insert(-1,' |')
    #   e.slice(0..(e.index(' |'))) if e.include?(' |')
    # end
    #
    # num_beers_array.delete_at(0)
    # chopped_num_beers_array = num_beers_array.map { |e| e.chop }
    # chopped_num_beers_array #why is this only giving the first 8??
  end

  def self.make_locations
    scrape_locations.each.with_index(1) do |location,i|
      new_location = WhatsOnTap::Location.new(location)
      # location
      puts "#{i}. #{new_location.name}"
    end

  end



end

#1. Class needs to instantiate new locations based on zip
#2. Scrape the location website for beer lists  ##and also scrape for beer details here?
#https://www.beermenus.com/places
#I'm not sure how to get this to pull up with the zip I want, which is all I need for now. Will ultimately want to be able to
#modiy based on the user inputted zip but will cross that bridge when I get to it
#I mostly just want to scrape bars and restaurants, places with multiple beers actually on tap. I guess I'm okay
# stores if it is also a sit down place and has >= 1 beer on tap
#maybe only give users 5 locations at a time



#3. Instantiate new beer objects
#4. and do what? scrape individual beer websites to get details and add those to beer objects? Or do I just get those details while scraping
#for the beer

#should not need class method here?
