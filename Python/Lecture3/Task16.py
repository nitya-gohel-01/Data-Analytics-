'''
Retails Sales Summary Program

Create a program using a list of at least 10 daily sales values. Your program must:

Display every daily sales value.
Calculate total and average sales.
Identify the highest and lowest sales.
Count days with sales above ₹50,000.
Count days with sales below ₹20,000.
Calculate the percentage of days with sales above ₹50,000.

use loops only
'''

sales = [15000, 20000, 12000, 25000, 30000, 18000, 22000, 55000, 60000, 45000]

total_sales = 0
average_sales = 0
highest_sales = sales[0]
lowest_sales = sales[0]
no_sales_above_50000 = 0
no_sales_below_20000 = 0
percentage_sales_above_50000 = 0

for sale in sales :
    
    print("Daily Sales: ", sale)
    
    total_sales += sale
    
    if sale > highest_sales:
        highest_sales = sale
        
    if sale < lowest_sales:
        lowest_sales = sale
        
    if sale > 50000:
        no_sales_above_50000 += 1
        
    if sale < 20000:
        no_sales_below_20000 += 1

average_sales = total_sales / len(sales)
percentage_sales_above_50000 = (no_sales_above_50000 / len(sales)) * 100

print("Total Sales: ", total_sales)
print("Average Sales: ", average_sales)
print("Highest Sales: ", highest_sales)
print("Lowest Sales: ", lowest_sales)
print("Number of Days with Sales Above ₹50,000: ", no_sales_above_50000)
print("Number of Days with Sales Below ₹20,000: ", no_sales_below_20000)
print("Percentage of Days with Sales Above ₹50,000: ", percentage_sales_above_50000, "%")