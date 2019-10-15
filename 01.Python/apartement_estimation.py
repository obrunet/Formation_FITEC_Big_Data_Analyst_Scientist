areas = [37, 47, 59, 69, 85, 105, 120]

def price(area, sum_area):
    return 4000*(area**2) / sum_area

# --------- 1st solution with a loop ---------
prices_1 = []
for a in areas:
    p = price(a, sum(areas))
    if p > 30000: prices_1.append(p)
print(prices_1)


# --------- 2nd solution - list comprehension ---------
sum_area = sum(areas)
prices_2 = [price(a, sum_area) for a in areas if price(a, sum_area)>30000 ]
print(prices_2)


# --------- 3rd with map & lambda ---------
price_bis = lambda a: 4000*(a**2) / sum_area
prices_3 = list(map(price_bis, areas))
print(prices_3)