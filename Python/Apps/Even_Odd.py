#Casey Salvador

import random

def even_odd(num):
    # If % 2 is 0, the number is even.
    # Since 0 is falsey, we have to invert it with not.
    return not num % 2

start = 5

​
# Make a while loop that runs until start is falsey.
while start:
    # Inside the loop, use random.randint(1, 99) to get a random number between 1 and 99.
    num = random.randint(1, 99)
    if even_odd(num):
        # If that random number is even (use even_odd to find out)...
        # print "{} is even", putting the random number in the hole.
        print("{} is even".format(num))
    else:
        # Otherwise, print "{} is odd", again using the random number.
        print("{} is odd".format(num))
    #decrement start
    start -= 1
