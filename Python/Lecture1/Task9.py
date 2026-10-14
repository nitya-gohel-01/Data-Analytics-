# Lecture Activity — Real Business Problem

quantity = int(input("Enter Quantity: "))
selling_price = int(input("Enter Selling Price: "))
cost_price = int(input("Enter Cost Price: "))

total_revenue = quantity * selling_price
total_cost = quantity * cost_price
total_profit = total_revenue - total_cost

print("\n--- Business Analysis ---")
print("Quantity:", quantity)
print("Selling Price:", selling_price)
print("Cost Price:", cost_price)
print("Total Revenue:", total_revenue)
print("Total Cost:", total_cost)
print("Total Profit:", total_profit)