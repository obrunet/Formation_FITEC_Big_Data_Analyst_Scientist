#!/usr/bin/env python
# coding: utf-8

import pandas as pd

df = pd.read_csv("Informations_nutritionnelles_McDo.csv")

#df.head()
#df[(df["Calories"] >= 0) & (df["Calories"] <= 200)].tail()

df[(df["Calories"] >= 0) & (df["Calories"] < 200)].to_csv("categorie1.csv")
df[(df["Calories"] >= 200) & (df["Calories"] < 450)].to_csv("categorie2.csv")
df[df["Calories"] >= 450].to_csv("categorie3.csv")