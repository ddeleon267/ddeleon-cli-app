9/18
User types whats-on-tap
runs program
enters zip
generates list of locals pubs
enters name of pubs
gets list of brews
specifies brew
selects specific items to get more info

9/18
Defined execution point (cli.rb file), stubbed out basic environment, set up call for cli

9/18
  How to describe each location?
    Each location has a name, has a location, a distance away from you, and a list of beers

  How to describe each beer?
    Each beer has a name, each beer has notes/flavors, maybe a type, and alcohol percentage, a price

9/19
should probably change name to whats_on_tap_gem or whats-on-tap-gem. annoying.

How to actually make these objects "Real" e.g. by scraping? Would like to start with the zip but I don't know how that would work.

For right now maybe just go through and work on beer class?

Or/also, figure out the scraping for the beers, then the locations, then figure out the whole zipcode piece?

9/20
Basically just played with file structure and dependencies today.

Also added some ideas for functionality in cli.rb #explore_beer. Need to work on Beer class as well

9/21
Some helpful notes on setting up scraper class in collaboration objects video around 27:--
Also in antipatterns video ~31

Really struggled with the CLI today. I want the user to be able to exit successfully at any point in the program without getting stuck in a loop or something similar. Was mostly successful, but at some points the user would have to enter exit twice in order to exit successfully.

After the #explore_beer method is called I would really like for the user to get back to the previous list of beers easily to select other beers.
I think I will come back to that later, though, as I want to get to refactoring my code so that it at least relies on objects (locations, beers) instead of strings.

9/28
It looks like the easiest way for me to go about scraping at least for right now is to scrape a site that basically functions as an app that does
what my app is doing-- scraping locations and scraping for data about beers. I'm not crazy about that and I'm not sure if it's ideal but I'm going to
try it and see what I can get working for now. Would be happy to modify later.

10/5
First part of program/cli is working correctly, takes city input and appropriately displays relevant locations via instantiating objects (and setting their attributes) rather than stubbing data.

Next step is to do the same for the beer objects.....need to be able to scrape individual location websites for their beer lists,
instantiate beer objects based on that last, and set properties in a similar fashion.
??? How to access individual sites in a dynamic way??????

https://www.beermenus.com/places/2348-uno-s-chicago-grill-neshaminy
https://www.beermenus.com/places/12091-uno-chicago-grill-deptford
https://www.beermenus.com/places/3120-chicago-street-pub

can successfully scrape for the urls e.g. /places/3120-chicago-street-pub, need to figure out where to go from there
