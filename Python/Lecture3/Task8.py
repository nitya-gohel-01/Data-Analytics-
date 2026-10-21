# count the number of negative values in a list of transactions 

transactions = [100, -50, 200, -30, 150, -10]
negativeCount = 0

for transaction in transactions:
    if transaction < 0:
        negativeCount += 1
        
print("The number of negative transactions is:", negativeCount)