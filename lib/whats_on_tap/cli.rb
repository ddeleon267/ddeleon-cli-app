class WhatsOnTap::CLI

  def call
    #order of operations of the cli

    welcome
    list_locations
    list_beers
    goodbye
  end

  def welcome
    #all this should do is greet the user
    puts "Welcome!"
    puts ""
    puts "If you'd like to find out what craft beers are on tap near you, you're in the right place!"
    puts ""
  end

  def make_locations
    #testing, put it in the wrong place before!
    WhatsOnTap::Scraper.scrape_location_url
    binding.pry

    WhatsOnTap::Scraper.scrape_locations.each.with_index(1) do |location,i|
      new_location = WhatsOnTap::Location.new(location)
      new_location.establishment_type = WhatsOnTap::Scraper.scrape_establishment_type[i]
      new_location.num_beers_on_tap = WhatsOnTap::Scraper.scrape_num_beers_on_tap[i]
      # location

      puts "#{i}. #{new_location.name}  (#{new_location.establishment_type})   --->   #{new_location.num_beers_on_tap}"


    end
  end

  def list_locations
    puts "Please enter your city to find the closest places offering craft brews on tap."
    puts ""
    city = gets.strip
    WhatsOnTap::Scraper.get_beer_menu_page(city)
    make_locations
  end

  def list_beers
    puts ""
    puts "Enter the number of the location for which you'd like to see the beer menu, or type 'list' to see the list of locations again, or type 'exit'."
    puts ""

    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
        #will probably need to change structure of this, 10 case statements seems excessive
      when "1"
        puts ""
        puts "beer list for location 1"
        explore_beer
      when "2"
        puts ""
        puts "beer list for location 2"
        explore_beer
      when "3"
        puts ""
        puts "beer list for location 3"
        explore_beer
      when "4"
        puts ""
        puts "beer list for location 4"
        explore_beer
      when "5"
        puts ""
        puts "beer list for location 5"
        explore_beer
      when "list"
        list_locations
      else
        puts "Type 'list' or 'exit.'"
      end

    end

  end

  def explore_beer
    @beers = Beer.scrape_beers

    puts ""
    puts "Enter the number of a beer you'd like to learn more about, or type 'list' to see the list of locations again, or type 'exit'."
    puts ""
    input = nil
    while input != "exit"
      input = gets.strip.downcase
    #
      case input
      when "1"
        puts ""

        puts @beers[0].name
        puts @beers[0].style
        puts @beers[0].notes
        puts @beers[0].abv
        puts @beers[0].price

      when "2"
        puts ""
        puts @beers[1].name
        puts @beers[1].style
        puts @beers[1].notes
        puts @beers[1].abv
        puts @beers[1].price
      when "3"
        puts ""
        puts @beers[2].name
        puts @beers[2].style
        puts @beers[2].notes
        puts @beers[2].abv
        puts @beers[2].price
      when "list"
        list_locations
      else
        puts ""
        puts "Type 'list' or 'exit.'"
        puts ""
      end
    end

 end

  def goodbye
    puts ""
    puts "Until next time!"
  end

end
