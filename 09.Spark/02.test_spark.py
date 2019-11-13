
# coding: utf-8

# In[1]:


import pyspark


# In[2]:


# on ne peut pas avoir deux context sur la meme instance sauf en jouant sur les ports
sc = pyspark.SparkContext('local[*]')
sc


# In[3]:


rdd = sc.parallelize([1, 2])
rdd


# In[4]:


sorted(rdd.cartesian(rdd).collect())


# In[5]:


get_ipython().system('ls')


# In[6]:


get_ipython().system('pwd')


# ---

# __La méthode first() retourne le 1er élt d'un RDD__

# In[7]:


x = sc.parallelize(range(1, 10))
x


# In[8]:


y = sc.parallelize([(1, 1), (1, 2), (3, 5), (3, 7), (8, 9)])


# In[9]:


z = sc.parallelize([])


# In[10]:


x.first()


# In[11]:


y.first()


# In[12]:


z.first()


# In[13]:


try:
    z.first()
except ValueError:
    print("ValueError !!")


# __La méthode take retourne un  tableau d’éléments, constitué des n  premiers éléments de la RDD source__

# In[14]:


x.take(-3)


# In[15]:


x.take(0)


# In[16]:


x.take(2)


# In[17]:


from pyspark.sql import DataFrame
from pyspark.rdd import RDD

if isinstance(x, RDD):
    print("RDD")
if isinstance(x, DataFrame):
    print("DataFrame")


# In[18]:


x.take(3)


# In[19]:


y.take(0)


# In[20]:


y.take(1)


# In[21]:


y.take(2)


# In[22]:


y.take(-5)


# In[23]:


z.take(2)


# In[24]:


z.take(3)


# ---
# 
# __La méthode map retourne une RDD en appliquant une fonction passée en argument à chaque item de la RDD source__

# In[43]:


w = sc.parallelize([7, 21, 12, 17, 19])


def f(a):
    return a/2, a%2


def g(a):
    return a * 100.0 / 20 


wf = w.map(f)
wf.collect()


# In[44]:


w.map(g).collect()


# In[45]:


if isinstance(w, RDD):
    print("RDD")
if isinstance(w, DataFrame):
    print("DataFrame")


# In[46]:


w.map(lambda a: (a/2, a%2)).collect()


# In[47]:


sorted(w.map(lambda a: (a/2, a%2)).collect())


# ---

# In[38]:


# La méthode count retourne le nombre d’éléments d’une RDD source
wf.count()


# In[59]:


x = sc.parallelize([(10, 2), (10, 5), (14, 2), (14, 7), (30, 2), (30, 3), (30, 5)])


# In[60]:


x.countByKey()


# In[61]:


x.countByKey().items()


# In[62]:


x = sc.parallelize([("a", 1), ("b", 1), ("a", 1)])
sorted(x.countByKey().items())


# ---

# In[70]:


x = sc.parallelize([(1, 2), (3, 5), (8, 10)])


# In[71]:


def f(a):
    return list(a)


# In[79]:


x.flatMap(f).collect()


# In[80]:


sc.parallelize([2, 3, 4]).flatMap(lambda x: range(1, x)).collect()


# In[75]:


sorted(rdd.flatMap(lambda x: [(x, x), (x, x)]).collect())


# ---

# In[78]:


r = sc.parallelize(range(100))
# 0.1 = pourcentage d'échantillonnage & 7 = seed
r.sample('true', 0.1, 7).collect()

