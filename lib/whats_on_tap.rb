#maybe this is where you will have to do requiring of scraper stuff (open-ur and nokogiri) plus pry
#it looks like maybe this is acting as my environment file? I.E. would normally go in its own folder titled 'config' and the file would be called 'environment.rb'
#I think avi deleted the module below in his video for that reason

require 'nokogiri'
require_relative "./whats_on_tap/version"
#maybe
#require_relative "whats_on_tap/version"

require_relative "./whats_on_tap/location"


require_relative './whats_on_tap/cli'
#maybe
#require_relative 'whats_on_tap/cli'

module WhatsOnTap
  # Your code goes here...
end


#maybe what you could do instead.. keep this file and the module in it, but add config folder and environment.rb file. Require that file i this one,
#a la "require_relative '../config/environment'"
