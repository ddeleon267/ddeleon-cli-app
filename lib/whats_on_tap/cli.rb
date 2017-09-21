#This is the CLI controller
#might not need to require anything here?
class WhatsOnTap::CLI

  def call
    puts "What's on Tap?"
    puts ""
    list_locations
    list_beers
    goodbye
  end

  def list_locations
    puts "Please enter your zip code to find the closest places offering craft brews on tap."

    #This is temporary, so code is workable for now. lists the stump locations before user is prompted to do anything
    @locations = WhatsOnTap::Location.all
    @locations.each.with_index(1) do |location, i|
      puts "#{i}. #{location.name} - #{location.distance} away"
    end
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
        puts "#1 beer list"
        explore_beer
      when "2"
        puts "#2 beer list"
        explore_beer
      when "3"
        puts "#3 beer list"
        explore_beer
      when "list"
        list_locations
      else
        puts "Type 'list' or 'exit.'"
      end

    end

  end

  def explore_beer
    #asks for prompt and responds to it
    puts "Enter the number of a beer you'd like to learn more about, or type 'list' to see the list of locations again, or type 'exit'."
    input_1 = nil
    while input_1 != "exit"
      input_1 = gets.strip.downcase
    #
      case input_1
      when "1"
        puts "some properties about beer #1"
      when "2"
        puts "some properties about beer #2"
      when "3"
        puts "some properties about beer #3"
      when "list"
        list_locations
      else
        puts "Type 'list' or 'exit.'"
      end
    end

 end

  def goodbye
    puts "Until next time!"
  end

end
