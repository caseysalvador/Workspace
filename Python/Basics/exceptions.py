try:
    count = int(input("Give me a number: "))
except ValueError:
    print("That's not a number!")
else:
    print("Hi " * count)

##creating addition function
def add(num1, num2):
    return (num1 + num2)
total = add(2, 2)
print(total)
