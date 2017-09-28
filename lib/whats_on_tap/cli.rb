#This is the CLI controller
#might not need to require anything here?
class WhatsOnTap::CLI

  def call
    # Scraper.scrape_beer_menus_site
    #Scraper.scrape_hop_angel_beer_list
    welcome
    list_locations
    list_beers
    goodbye
  end

  def welcome
    puts "Welcome!"
    puts "If you'd like to find out what craft beers are on tap near you, you're in the right place!"
    puts ""
  end

  def list_locations
    #This doesn't actually work as planned now, just has some stubbed locations below that are near me
    puts "Please enter your zip code to find the closest places offering craft brews on tap."
    puts ""

    #This is temporary, so code is workable for now. lists the stump locations before user is prompted to do anything
    @locations = WhatsOnTap::Location.all
    @locations.each.with_index(1) do |location, i|
      puts "#{i}. #{location.name} - #{location.distance} away"
    end
  end

  def list_beers
    #should probably refactor this to iterate over @locations, is obnoxious as it stands
    puts ""
    puts "Enter the number of the location for which you'd like to see the beer menu, or type 'list' to see the list of locations again, or type 'exit'."
    puts ""
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts ""
        puts @locations[0].beer_list
        explore_beer
      when "2"
        puts ""
        puts @locations[1].beer_list
        explore_beer
      when "3"
        puts ""
        puts @locations[1].beer_list
        explore_beer
      when "list"
        list_locations
      else
        puts "Type 'list' or 'exit.'"
      end

    end

  end

  def explore_beer
    # binding.pry
    @beers = Beer.all

    #asks for prompt and responds to it
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
        #eventually will need to refactor this to iterate over @beers bc right now it's ugly AF

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
