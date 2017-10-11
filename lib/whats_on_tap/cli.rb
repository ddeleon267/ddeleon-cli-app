class WhatsOnTap::CLI

  def call
    welcome
    get_locations
    list_locations
    get_beers
    list_beers
    get_a_beer_and_list_details
    goodbye
  end

  def welcome
    puts "Welcome to What's On Tap!"
    puts ""
  end

  def get_locations
    puts "Please enter your city to find places offering craft beers on tap near you."
    puts ""
    city = gets.strip
    WhatsOnTap::Scraper.get_beer_menu_site(city)
    puts ""
    WhatsOnTap::Scraper.make_locations
  end

  def list_locations
    WhatsOnTap::Location.all.each.with_index(1) do |location_object, i|
      puts "#{i}. #{location_object.name}  #{location_object.establishment_type}   --->   #{location_object.num_beers_on_tap}"
    end
  end

  def get_beers
    puts ""
    puts "Enter the number of the location for which you'd like to see the beer menu, or type 'exit'."
    puts ""

    location_number = gets.strip.to_i - 1
    WhatsOnTap::Scraper.get_beer_list_page(location_number)

    puts ""
    WhatsOnTap::Scraper.make_beers
  end

  def list_beers
    WhatsOnTap::Beer.all.each.with_index(1) do |beer_object, i|
      puts "#{i}. #{beer_object.name}"
    end
  end

  def get_a_beer_and_list_details
    puts ""
    puts "Enter the number of a beer you'd like to learn more about, or type 'list' to see the list of locations again, or type 'exit'."
    puts ""

    beer_number = gets.strip.to_i - 1

    WhatsOnTap::Scraper.get_beer_info_page(beer_number)

    WhatsOnTap::Scraper.get_and_set_beer_attributes(beer_number)

    beer_object = WhatsOnTap::Beer.all[beer_number]
    puts ""
    puts "#{beer_object.name}"
    puts "Brewery: #{beer_object.brewery}"
    puts "Brewery Location: #{beer_object.brewery_location}"
    puts "Type: #{beer_object.type}"
    puts "ABV: #{beer_object.abv}"
    puts "Description: #{beer_object.full_description}"
    puts ""
  end

  def goodbye
    puts ""
    puts "Until next time!"
  end

end
