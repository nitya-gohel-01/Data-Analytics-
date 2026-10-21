# find lowest sales value without using min() function 

sales = [100, 200, 50, 300, 150]
lowestSale = sales[0]

for i in range(len(sales)):
    if sales[i] < lowestSale:
        lowestSale = sales[i]   
        
print("The lowest sales value is:", lowestSale)