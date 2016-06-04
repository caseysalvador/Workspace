##functions.py##

def hows_the_parrot():
    print("He's pining for the fjords!")

hows_the_parrot()

def lumberjack(name):
    if name.lower() == 'casey':
        print("Casey's a lumber and he's OK!")
    else:
        print("{} sleeps all night and {} works all day!".format(name, name))

lumberjack(('Casey'))
##
print("\n")
##
def lumber_jack(name, pronoun):
        print("{}'s a lumberjack and {} OK!".format(name, pronoun))

lumber_jack("April", "she's")
lumber_jack("Craig", "he thinks he's")
lumber_jack("Christian", "he's not")
##
print("\n")

def average(num1, num2):
    return(num1+num2) / 2 ##return value returns to console.

avg = average(2,8)

print("The average of 2 & 8 is: " + str(avg))

# if index of item 0 is a continue
def loopy(items):
    for item in items:
        if item[0] == 'a':
            continue
        print(item
