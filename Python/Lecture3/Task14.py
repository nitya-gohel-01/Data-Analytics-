# Calculate total revenue for a list of product quantities and prices.

quantities = [15, 20, 10, 5]
prices = [100,350,900,500]
total_revenue = 0

for i in range(len(quantities)):
    
    total_revenue += quantities[i] * prices[i]
    
print("Total Revenue: ", total_revenue)