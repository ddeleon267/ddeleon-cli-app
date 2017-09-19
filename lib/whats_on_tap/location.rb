#might not need to require anything here?

class WhatsOnTap::Location
  @@locations = []

  attr_accessor :name, :location, :distance, :beer_list

  def self.all
    #I should return a bunch of instances of locations
    puts <<-DOC
    1. Hop Angel Brauhaus - 1.0 miles away
    2. Grey Lodge Pub - 2.7 miles away
    3. Gat Beer - 2.7 miles away
    DOC
  end

  def initialize

    @@locations << self
  end

end
