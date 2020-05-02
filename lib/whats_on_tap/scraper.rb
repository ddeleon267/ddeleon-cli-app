require "pry"
class WhatsOnTap::Scraper

  def self.get_beer_menu_site(city)
    encoded_city = URI::encode(city)
    Nokogiri::HTML(open("https://www.beermenus.com/search?q=#{encoded_city}"))
  end

  def self.make_locations(city)
    page = self.get_beer_menu_site(city)
    page.css("div.pure-u-1").each do |data|
      name = data.css("h3 a").text
      location = WhatsOnTap::Location.find_by_name(name)
      if !location
        location_details = {
          name: name,
          type: data.css("h3 span").text,
          num_beers_on_tap: data.css("p.caption.text-gray.mb-small").text,
          city: city,
          url: data.css("h3.mb-0.text-normal a").first.attributes["href"].value
        }
        WhatsOnTap::Location.new(location_details)
      end
    end
  end

  def self.get_beer_list_page(location)
    modified_page_url = "https://www.beermenus.com/#{location.url}"
    Nokogiri::HTML(open(modified_page_url))
  end



## just envisioning how I might approach this broken code (see notes below) more appropriately,
## if my ability to scrape were not hindered. hence the psuedocode

# def self.make_beers(location)
#   page = self.get_beer_list_page(location)
#   page.css("some selector here").each do |beer_anchor_tag|
#     name = ## get name from anchor tag
#     url = ## get url from anchor tag
#     beer = WhatsOnTap::Beer.find_by_name(name)
#     if !beer && beer_name != ""
#       location.beers << WhatsOnTap::Beer.new(name: name, url:url)
#     end
#   end
# end


  #########################################################################################
  #######################################################################################

  ## The code below here is obsolute :( and generally very ugly. zipper pattern and quite clunky
  ## the location pages don't allow for scraping of the beers anymore, so that aspect of the functionality breaks
  # def self.make_beers
  #   self.scrape_beer_names.each do |beer_name|
  #     beer = WhatsOnTap::Beer.find_by_name(beer_name)
  #     if !beer && beer_name != ""
  #       WhatsOnTap::Beer.new(name: beer_name)
  #     end
  #   end
  # end
  #
  # def self.scrape_beer_names
  #     self.beer_list_page.css("h3.mb-0.text-normal a").take(10).map {|p| p.text}
  # end

#   def self.get_beer_info_page(beer_number)
#     modified_page_url = "https://www.beermenus.com#{self.scrape_beer_urls[beer_number]}"
#     @@beer_page = Nokogiri::HTML(open(modified_page_url))
#   end
#
#   def self.beer_page
#     @@beer_page
#   end
#
# # helper method for #get_beer_info_page
#   def self.scrape_beer_urls
#     self.beer_list_page.css("h3.mb-0.text-normal a").take(5).map { |link| link['href']}
#   end
#
# #######################################################################################
#   def self.get_and_set_beer_attributes(beer_number)
#     beer_attribute_array = self.scrape_individual_beer_data
#     beer_object = WhatsOnTap::Beer.all[beer_number]
#
#     beer_object.brewery = beer_attribute_array[0]
#     beer_object.brewery_location = beer_attribute_array[1]
#     beer_object.type = beer_attribute_array[2]
#     beer_object.abv = beer_attribute_array[3]
#     beer_object.full_description = beer_attribute_array[4]
#     beer_object
#   end
#
#   def self.scrape_individual_beer_data
#     brewery = self.beer_page.css("div.pure-f-body a").text
#     brewery_location = self.beer_page.css("p.mt-tiny.mb-0").text
#
#     #formatting type and abv attributes
#     type_and_abv_data = self.beer_page.css("li.caption.lead-by-icon p").text.split("\n")[1]
#     if type_and_abv_data == nil || type_and_abv_data == []
#       type_and_abv = ""
#     else
#       type_and_abv = type_and_abv_data.strip.split("·")
#     end
#     type = type_and_abv[0].strip unless type_and_abv[0] == nil
#     abv = type_and_abv[1].strip.gsub(" ABV", "") unless type_and_abv[1] == nil
#
#     #formatting full_description attribute
#     notes = self.beer_page.css("div.caption p")[0].text unless self.beer_page.css("div.caption p")[0] == nil
#     description = self.beer_page.css("div.caption.beer-desc p").text
#     if notes == nil
#       full_description = description
#     elsif description == nil
#       full_description = notes
#     elsif notes == nil && description == nil
#       full_description = ""
#     elsif description.include?("#{notes}")
#       full_description = description
#     else
#       full_description = notes+description
#     end
#
#     beer_data = [brewery, brewery_location, type, abv, full_description]
#
#     beer_data.map do |attribute|
#        if attribute == nil || attribute == ""
#          attribute = "No information available"
#        else
#          attribute = attribute
#        end
#      end
#   end #end ::scrape_individual_beer_data
# end
