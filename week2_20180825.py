import pandas as pd

d1 = {'A':[1,0,0,1], 'B':[0,1,1,0], 'C':[0,1,1,0], 'D':[1,0,0,1]}

# the prints are for testing output

# Problem 1
def makeDataFrame(data):
	# YOUR SOLUTION STARTS HERE
	return pd.DataFrame.from_dict(data)
    # YOUR SOLUTION ENDS HERE

print(makeDataFrame(d1))

# Problem 2a
def load():
	#SOLUTION START( ~ 1 line of code)
	return pd.read_csv("data/openrice.csv")
	#SOLUTION END


df = load() # use df for the remaining problems

# Problem 2b
def makeCategory():
	df1 = pd.read_csv('data/openrice.csv')
	dic1 ={"Below $50": "Cheap","$51-100": "Not Cheap","$101-200": "Expensive", "$201-400": "Very Expensive"}
	df1['price_category'] = df1['price_range'].map(dic1)
	#SOLUTION START( ~ 1-2 lines of code)
	return df1['price_category']
	#SOLUTION END

print(makeCategory())

# Problem 2c
def totalDislike():
	#SOLUTION START( ~ 1-2 line of code)
	df1 = pd.read_csv('data/openrice.csv')
	return df1.groupby('price_range').dislikes.sum()
	#SOLUTION END

print(totalDislike())


# Problem 2d
def totalBookmarks():
	#SOLUTION START( ~ 1-2 line of code)
	df1 = pd.read_csv('data/openrice.csv')
	return df1.loc[df1['food_type']=='Hong Kong Style'].bookmarks.sum()
	#SOLUTION END

print(totalBookmarks())


# Problem 2e
def extractReview():
	#SOLUTION START( ~ 1-2 line of code)
	import re
	df1 = pd.read_csv('data/openrice.csv')
	return [re.search("\d+",i).group() for i in df1['number_of_reviews']]
	#SOLUTION END

print(extractReview())
