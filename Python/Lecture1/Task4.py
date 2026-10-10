# Task 4 - Profit Calculation

sales = int(input("Enter Sales: "))
cost = int(input("Enter Cost: "))

profit = sales - cost
profit_percentage = (profit / sales) * 100

print("\n--- Profit Details ---")
print("Sales:", sales)
print("Cost:", cost)
print("Profit:", profit)
print("Profit Percentage:", profit_percentage, "%")