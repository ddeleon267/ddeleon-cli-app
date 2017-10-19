# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application

      There is a WhatsOnTap::CLI class in lib that is responsible for the user interface (welcoming user, asking for input,
      displaying data in response, etc.)

- [x] Pull data from an external source

      Location and beer objects are instantiated and given attributes based on data scraped from the site beermenus.com
      -Data is pulled from the list of an individual city's beer locations (to instantiate location objects and add attributes)
      -Data is pulled from the list of an individual locations's beers (to instantiate beer objects with a name attribute)
      -Data is pulled from an individual beer's page (to add additional attributes to existing beer objects)

- [x] Implement both list and detail views

      See above.

      -CLI prompts user for city input --> CLI displays list of locations for a city
      -CLI prompts user to choose a location --> CLI displays list of beers for a location
      -CLI prompts user to choose a beer --> CLI displays additional details about beer chosen
