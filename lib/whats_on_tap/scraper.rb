class Scraper

  # def initialize(url)
  #   @location = Location.new
  #
  # end


  def scrape
    #not sure how to get this to work. not sure if even accessing site correctly
    @doc = Nokogiri::HTML(open("https://www.beermenus.com/places/19111"))
    @doc.css("h3.mb-0.text-normal").first.text

  end

  def scrape_hop_angel_beer_list

    #@doc = Nokogiri::HTML(open("http://hopangel.com/beer.html"))
    # binding.pry
    # @doc.css("h1").text  #so this is doing nothing????

  end



end

#1. Class needs to instantiate new locations based on zip
#2. Scrape the location website for beer lists  ##and also scrape for beer details here?
#https://www.beermenus.com/places
#I'm not sure how to get this to pull up with the zip I want, which is all I need for now. Will ultimately want to be able to
#modiy based on the user inputted zip but will cross that bridge when I get to it
#I mostly just want to scrape bars and restaurants, places with multiple beers actually on tap. I guess I'm okay
# stores if it is also a sit down place and has >= 1 beer on tap
#maybe only give users 5 locations at a time



#3. Instantiate new beer objects
#4. and do what? scrape individual beer websites to get details and add those to beer objects? Or do I just get those details while scraping
#for the beer

#should not need class method here?
