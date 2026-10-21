# calculate profit for each product using separate sales and cost lists

products = ['mobile', 'laptop', 'tablet', 'headphones']
costs = [40000, 80000, 30000, 5000]
sales = [500000, 1000000, 400000, 70000]

for i in range(len(products)):
    
    profit = sales[i] - costs[i]
    print(f"The profit for {products[i]} is: {profit}")