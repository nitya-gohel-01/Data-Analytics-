# calculate total and average of listed 10 sales values

sales = [10000 , 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000]
total = 0

for sale in sales:
    total += sale   
    
average = total / len(sales)

print("The total sales is:", total)
print("The average sales is:", average)