# find the highest sales value without using max() function

sales = [10000 , 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000]

highestSale = sales[0]

for sale in sales:
    
    if sale > highestSale:
        highestSale = sale

print("The highest sales value is:", highestSale)