class WhatsOnTap::CLI

  def call
    #order of operations of the cli

    welcome
    list_locations
    # binding.pry
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

  def list_locations
    #This doesn't actually work as planned now, just has some stubbed locations below that are near me
    puts "Please enter your city to find the closest places offering craft brews on tap."
    puts ""

    #get user input and do something with it

    WhatsOnTap::Scraper.make_locations
  end

  def list_beers
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
