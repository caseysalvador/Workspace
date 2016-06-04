#Number Game
import random # importing the random library

# generate a random number between 1-10
secret_num = random.randint(1, 10)

while True:
    # get a number guess from the player
    guess = int(input("Guess a numbe between 1 and 10: "))
    # compare guess to secret number
    if guess == secret_num:
        print("You got it! My number was {}".format(secret_num))
        break
    else:
        print("That's not it!")
    # print hit/miss


