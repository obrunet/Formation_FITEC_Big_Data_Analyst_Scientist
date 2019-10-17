import requests, os, pickle, html5lib
from bs4 import BeautifulSoup


URL_1 = "http://quotes.toscrape.com/page/1/"
URL_2 = "http://quotes.toscrape.com/page/2/"

filename_1 = 'scraped_quotes_1_result.pickle'
filename_2 = 'scraped_quotes_2_result.pickle'


def retrieve_quotes(url, filename):
    """Retrieve the different quotes of a single web page, save page in a bin file & return a list of quotes"""
    if os.path.exists(filename):
        with open(filename, 'rb') as f:
            print(f"Loading cached {filename}")
            result = pickle.load(f)
    else:
        print(f"Fetching {url} from the internet")
        result = requests.get(url)
        with open(filename, 'wb') as f:
            print(f"Writing cached {filename}")
            pickle.dump(result, f)

    assert result.status_code == 200, f"Got status code {result.status_code} which isn't a success"
    source = result.content
    soup = BeautifulSoup(source, 'html5lib')

    quote_blocks, quotes = soup.find_all('span', class_='text'), []
    for q in quote_blocks:
        quotes.append(str(q.string).replace('”', '').replace('“', ''))

    return quotes


all_quotes = []
all_quotes.extend(retrieve_quotes(URL_1, filename_1))
all_quotes.extend(retrieve_quotes(URL_2, filename_2))
print(all_quotes)


