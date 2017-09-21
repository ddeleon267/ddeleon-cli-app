#My environment! Yeehaw

#General load order:
#1.load bundler
#2.Require the gems from the Gemfile using bundler
#3. Load libraries

require 'bundler'


#moved all this here from whats_on_tap.rb
require_relative "../lib/whats_on_tap/version.rb"
#maybe
#require_relative "whats_on_tap/version"

require_relative "../lib/whats_on_tap/location"


require_relative '../lib/whats_on_tap/cli'
#maybe
#require_relative 'whats_on_tap/cli'
