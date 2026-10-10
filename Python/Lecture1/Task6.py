# Task 6 - Customer Bill 

product_name = input("Enter Product Name: ")
quantity = int(input("Enter Quantity: "))
unit_price = float(input("Enter Unit Price: "))

total_amount = quantity * unit_price

print("\n--- Customer Bill ---")
print("Product:", product_name)
print("Quantity:", quantity)
print("Unit Price:", unit_price)
print("Total Amount:", total_amount)