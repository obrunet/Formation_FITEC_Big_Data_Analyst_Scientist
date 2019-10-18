"""List all pokemons on the web page https://pokemondb.net/pokedex/national
in order to use bs4 & requests libs"""

import os, requests, pickle, html5lib
from bs4 import BeautifulSoup


URL = 'https://pokemondb.net/pokedex/national'
file_name = 'scraped_pokemon_page.pickle'


# scrape the web page then if succeed, write a binary file for later use
if not os.path.exists(file_name):
    result = requests.get(URL)
    assert result.status_code == 200 > 0, f'Attempt to retrieve web page failed - code {result.status_code}'
    with open(file_name, 'wb') as f:
        pickle.dump(result, f)
else:
    with open(file_name, 'rb') as f:
        result = pickle.load(f)

soup = BeautifulSoup(result.content, 'html5lib')

# retrieve all pokemon's names in a txt file
names = [n.string for n in soup.find_all("a", class_="ent-name")]
with open("all_pokemons' names.txt", 'wt') as f:
    f.write('\n'.join(names))

# get all infocards with links for each element
#infocards = soup.find_all("div", class_="infocard")
