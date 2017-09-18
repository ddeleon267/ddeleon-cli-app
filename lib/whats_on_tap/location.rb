class WhatsOnTap::Location
  @@locations = []

  def self.all
    #I should return a bunch of instances of locations
  end

  def initialize

    @@locations << self
  end

end
