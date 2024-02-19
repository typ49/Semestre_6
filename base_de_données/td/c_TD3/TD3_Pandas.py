#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd

# Sample data
data1 = [1, 8, 7, 5, 6, 5, 3, 4, 7, 1]
data2 = [1, 8, 7, 5, 6, 5, 3, 4, 7, 1]

# Création de deux séries Pandas
serie1 = pd.Series(data1)
serie2 = pd.Series(data2)

# Vérification de l'égalité des deux séries
egalite = serie1.equals(serie2)

print("Les deux séries sont-elles égales ?", egalite)


# In[ ]:




