# Homework 

# Problem 2 — Product Bill

product_name = input("Enter Product Name: ")
quantity = int(input("Enter Quantity: "))
price = float(input("Enter Price: "))
discount = float(input("Enter Discount Percentage: "))

total_amount = quantity * price
discount_amount = total_amount * discount / 100
final_bill = total_amount - discount_amount

print("\n--- Product Bill ---")
print("Product:", product_name)
print("Quantity:", quantity)
print("Price:", price)
print("Discount:", discount, "%")
print("Total Amount:", total_amount)
print("Discount Amount:", discount_amount)
print("Final Bill Amount:", final_bill)