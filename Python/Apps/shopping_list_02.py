#Shopping List

# clean code up

# make a list to hold onto our items
shopping_list = []

# have a HELP command
def show_help():
    
    # print out instructions on how to use the app
    print("What should we pick up at the store? ")
    print("""
Enter 'DONE' to stop adding items.
Enter 'HELP' for this help.
Enter 'SHOW' to see your current list.
""")

# shows list
def show_list():
    # print out the list
    print("Here's your current list: ")

    for item in shopping_list:
        print(item)

def add_to_list(new_item):
    # add new items to our list
    shopping_list.append(new_item) #adding to the list using append
    # len gives us the amount of items in a list
    print("Added {}. List now has {}. ".format(new_item, len(shopping_list)))
show_help()
          
while True:
    # ask for new items
    new_item = input("> ")

    if new_item == 'DONE':
        break
    elif new_item == 'HELP':
        show_help()
        continue
    elif new_item == 'SHOW':
        show_list()
        continue
    add_to_list(new_item)    

show_list()

