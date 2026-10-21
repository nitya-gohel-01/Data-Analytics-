# Build a sales report showing total sales, average sales, highest sales, and number of high-sales days.

sales = [15000, 20000, 12000, 25000, 30000, 18000, 22000]

total_sales = 0
average_sales = 0 
highest_sales = 0 
num_high_sales_days = 0 

for sale in sales:
    
    total_sales += sale
    
    if sale > highest_sales:
        highest_sales = sale
        
    if sale > 20000:
        num_high_sales_days += 1

average_sales = total_sales / len(sales)

print("Total Sales: ", total_sales)
print("Average Sales: ", average_sales)
print("Highest Sales: ", highest_sales)
print("Number of High-Sales Days: ", num_high_sales_days)