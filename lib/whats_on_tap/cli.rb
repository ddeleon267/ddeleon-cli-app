class WhatsOnTap::CLI

  def call
    welcome
    list_locations
    list_beers
    explore_beer
    goodbye
  end

  def welcome
    puts "Welcome!"
    puts ""
    puts "If you'd like to find out what craft beers are on tap near you, you're in the right place!"
    puts ""
  end

  def list_locations
    puts "Please enter your city to find the closest places offering craft brews on tap."
    puts ""
    city = gets.strip
    WhatsOnTap::Scraper.get_beer_menu_page(city)
    puts ""
    make_locations
  end

  def make_locations
    WhatsOnTap::Scraper.scrape_location_url

    WhatsOnTap::Scraper.scrape_locations.each.with_index(1) do |location,i|
      new_location = WhatsOnTap::Location.new(location)
      new_location.establishment_type = WhatsOnTap::Scraper.scrape_establishment_type[i]
      new_location.num_beers_on_tap = WhatsOnTap::Scraper.scrape_num_beers_on_tap[i]

      puts "#{i}. #{new_location.name}  (#{new_location.establishment_type})   --->   #{new_location.num_beers_on_tap}"
    end
  end

  def list_beers
    puts ""
    puts "Enter the number of the location for which you'd like to see the beer menu, or type 'list' to see the list of locations again, or type 'exit'."
    puts ""

    place = gets.strip.to_i - 1
    WhatsOnTap::Scraper.get_beer_list_page(place)

    puts ""
    make_beers
  end

  def make_beers
    WhatsOnTap::Scraper.scrape_beers.each.with_index(1) do |beer,i|
      new_beer = WhatsOnTap::Beer.new(beer)
      puts "#{i}. #{new_beer.name}"
    end
  end

  def explore_beer
    puts ""
    puts "Enter the number of a beer you'd like to learn more about, or type 'list' to see the list of locations again, or type 'exit'."
    puts ""


    beer = gets.strip.to_i - 1
    WhatsOnTap::Scraper.get_beer_data_page(beer)
    WhatsOnTap::Scraper.scrape_individual_beer_data
    

    puts ""
  end

  def goodbye
    puts ""
    puts "Until next time!"
  end

end
