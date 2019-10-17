import requests
import html5lib
from bs4 import BeautifulSoup


# page url to load
URL = "http://pokemondb.net/pokedex/national"

# step 1 connect to the page, retrieve the source code
req = requests.get(URL)
page_html = req.content

# display the page (raw format)
print(page_html)

# step 2 create soup and parse the page
soup = BeautifulSoup(page_html, "html5lib")
print(soup)





