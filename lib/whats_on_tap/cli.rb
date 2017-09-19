#This is the CLI controller
#might not need to require anything here?
class WhatsOnTap::CLI

  def call
    puts "What's on Tap?"
    list_locations
    list_beers
    goodbye
  end

  def list_locations
    #ultimately --> would generate list of places nearby. For now:
    # puts <<-DOC
    # 1. Hop Angel Brauhaus - 1.0 miles away
    # 2. Grey Lodge Pub - 2.7 miles away
    # 3. Gat Beer - 2.7 miles away
    # DOC
    @locations = WhatsOnTap::Location.all
    @locations.each.with_index(1) do |location, i|
      puts "#{i}. #{location.name} - #{location.distance} away"
    end
  end

  def list_beers
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

  def goodbye
    puts "Until next time!"
  end

end
