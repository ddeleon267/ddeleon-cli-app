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
    puts ""
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
      #would like to make this display in a nicer way
      puts "#{i}. #{location_object.name}  #{location_object.establishment_type}   --->   #{location_object.num_beers_on_tap}"
    end
  end

  def get_beers
    puts ""
    puts "Enter the number of the location for which you'd like to see the beer menu."
    puts "You can also type 'back' to try a new city, or type 'exit' to exit"
    puts ""

    input = gets.strip
     if input.to_i > 0 && input.to_i < 6
       location_number = input.to_i - 1
       WhatsOnTap::Scraper.get_beer_list_page(location_number)
       puts ""
       WhatsOnTap::Scraper.make_beers
     elsif input.downcase == "exit"
       exit
     elsif input.downcase == "back"
       puts ""
       input = nil
       call
     else
       puts ""
       puts "Please try again."
       puts ""
       input = nil
       list_locations
     end
  end

  def list_beers
    WhatsOnTap::Beer.all.each.with_index(1) do |beer_object, i|
      puts "#{i}. #{beer_object.name}"
    end
  end

  def get_a_beer_and_list_details
    puts ""
    puts "BLOOP BLOOP"
    puts "Enter the number of a beer you'd like to learn more about. You can also type 'list' to see the list of locations again, type 'back' to start over, or type 'exit' to exit."
    puts ""

    beer_input = gets.strip
    if beer_input.to_i > 0 && beer_input.to_i <10
      beer_number = beer_input.to_i - 1
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
    elsif beer_input.downcase == "exit"
      exit
    elsif beer_input.downcase == "back"
      puts ""
      input = nil #not sure if I need this??
      get_locations
      list_locations
      get_beers
      list_beers
      get_a_beer_and_list_details
    elsif beer_input.downcase == "list"
      list_locations
      get_beers
      list_beers
      get_a_beer_and_list_details
    else
      puts ""
      puts "Please try again."
      puts ""
      input = nil #not sure if I need this??
    end
  end #end of get_a_beer_and_list_details

  def goodbye
    puts ""
    puts "Until next time!"
  end

end
