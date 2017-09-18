#This is the CLI controller

class WhatsOnTap::CLI

  def call
    puts "What's on Tap?"
    list_locations
  end

  def list_locations
    #ultimately --> would generate list of places nearby. For now:
    puts <<-DOC
    1. Hop Angel Brauhaus - 1.0 miles away
    2. Grey Lodge Pub - 2.7 miles away
    3. Gat Beer - 2.7 miles away
    DOC
  end

end
