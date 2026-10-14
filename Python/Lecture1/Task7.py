# Task 7 - Discount Calculation

price = float(input("Enter Price: "))
discount = float(input("Enter Discount Percentage: "))

discount_amount = price * discount / 100
final_price = price - discount_amount

print("\n--- Discount Details ---")
print("Price:", price)
print("Discount:", discount, "%")
print("Discount Amount:", discount_amount)
print("Final Price:", final_price)