# Homework 

# Problem 1 — Employee Annual Income

employee_name = input("Enter Employee Name: ")
monthly_salary = int(input("Enter Monthly Salary: "))
bonus = float(input("Enter Bonus: "))

annual_income = (monthly_salary + bonus) * 12

print("\n--- Employee Income ---")
print("Employee Name:", employee_name)
print("Monthly Salary:", monthly_salary)
print("Bonus:", bonus)
print("Annual Income:", annual_income)