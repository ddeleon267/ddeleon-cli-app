#This is the CLI controller

class WhatsOnTap::CLI

  def call
    puts "What's on Tap?"
    list_locations
    list_beers
    goodbye
  end

  def list_locations
    #ultimately --> would generate list of places nearby. For now:
    puts <<-DOC
    1. Hop Angel Brauhaus - 1.0 miles away
    2. Grey Lodge Pub - 2.7 miles away
    3. Gat Beer - 2.7 miles away
    DOC
  end

  def list_beers
    puts "Enter the number of the location for which you'd like to see the beer menu, or type 'exit'."
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "#1 beer list"
      when "2"
        puts "#2 beer list"
      when "3"
        puts "#3 beer list"
      end
    end
  end

  def goodbye
    puts "Until next time!"
  end

end
