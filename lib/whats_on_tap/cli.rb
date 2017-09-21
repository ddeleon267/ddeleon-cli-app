#This is the CLI controller
#might not need to require anything here?
class WhatsOnTap::CLI

  def call
    puts "What's on Tap?"
    list_locations
    list_beers
    #explore_beer
    goodbye
  end

  def list_locations
    #ultimately --> would generate list of places nearby. For now:
    # puts <<-DOC
    # 1. Hop Angel Brauhaus - 1.0 miles away
    # 2. Grey Lodge Pub - 2.7 miles away
    # 3. Gat Beer - 2.7 miles away
    # DOC
    puts "Please enter your zip code to find the closest places offering craft brews on tap."
    #perhaps offer other options, like exiting or going back and trying with a differnt zipcode
    #gets inputs and do something with it
    #display list of beer places based on what is given

    #This is temporary, so code is workable for not. lists the stump locations before user is prompted to do anything
    @locations = WhatsOnTap::Location.all
    @locations.each.with_index(1) do |location, i|
      puts "#{i}. #{location.name} - #{location.distance} away"
    end
  end

  def list_beers
    #asks for prompt and responds to it
    input = nil
    while input != "exit"
      puts "Enter the number of the location for which you'd like to see the beer menu, or type 'list' to see the list of locations again, or type 'exit'."
      input = gets.strip.downcase

      if input.to_i > 0
        the_location = @locations[input.to_i - 1]
        puts "#{the_location.name} - #{the_location.distance} away"
      elsif input == "list"
        list_locations
      else
        puts "Not sure what you want, type list or exit."
      end
      # case input
      # when "1"
      #   puts "#1 beer list"
      # when "2"
      #   puts "#2 beer list"
      # when "3"
      #   puts "#3 beer list"
      # when "list"
      #   list_locations
      # # else
      # #   "Type 'list' or 'exit.'"
      # end
    end
  end

  def explore_beer
    #asks for prompt and responds to it
    #input = nil
    #while input != "exit"
      #puts "Enter the number of the beer that you're like to learn more about, or type 'list' to see the list of locations again, or type 'exit'
      #input = gets.strip.downcase

      #if input.to_i > 0
        #the_beer = @beers[input.to_i - 1]
        #puts "#{the_beer.name} - #{the_beer.type} - #{the_beer.notes} - #{the_beer.alcohol_percentage} - #{the_beer.price}"
      #elsif input == "list"
        #list_locations
      #else
        #puts "Not sure what you want, type list or exit."
      #end
    #end

  end

  def goodbye
    puts "Until next time!"
  end

end
