#Grocery Shopping List app
#Copyright: Casey Chad Salvador
#Defined Grocery List

#Create a list that holds our items
grocery_list = []
shopping_list = []

#Define instructions
def instructions():
    print("""
    Enter 'DONE' to stop adding to our grocery list.
    Enter 'HELP' for additional help & instructions.
    Enter 'SHOWALL' to see your current items in both Grocery & Shopping lists.
    Enter 'GROCERY' to see your current items in your Grocery List.
    Enter 'SHOPPING' to see your current items in your Shopping List.
    """)

#Define show grocery list function
def show_glist():
    print("Currently you have these items in your grocery list: ")
    for food in grocery_list:
        print(food)
    print("")

#Define show shopping list function
def show_slist():
    print("Currently you have these items in your shopping list: ")
    for item in shopping_list:
        print(item)
    print("")

#Define show both lists
def show_lists():
    print("Currently in both lists you have the following:")
    mergedlist = shopping_list + grocery_list
    for newItems in mergedlist:
        print(newItems)
    print("You currently have {} in your list. ".format(len(mergedlist)))
    print("")

#Define grocery list function
def add_to_glist(new_food):
    grocery_list.append(new_food) #appending a new item to the list
    print("You've added {} to your grocery list. You currently have {} in your list. ".format(new_food, len(grocery_list)))
    print("")
#Define shopping list function
def add_to_slist(new_item):
    shopping_list.append(new_item)
    print("You've added {} to your shopping list. You currently have {} in your shopping list. ".format(new_item, len(shopping_list)))
    print("")
#Main
print("What should we pick up at the store today? ")
#Create loop that will require you an input
while True:
    print("Please indicate if this is a grocery or shopping item: ")
    print("Enter 'FOOD' or 'SHOP' to place the correct item in the appropriate list.")
    print("Enter 'HELP' if you are in need of assistance/instructions.")
    #asking for new items
    new_entry = input(":> ")
    if new_entry == 'FOOD':
        new_food = input("Enter Grocery: ")
        add_to_glist(new_food)
    elif new_entry == 'SHOP':
        new_item = input("Enter Item: ")
        add_to_slist(new_item)
    elif new_entry == 'HELP':
        instructions()
        new_help = input("> ")
        #if/else statement
        if new_help == 'DONE':
            break
        elif new_help == 'HELP':
            instructions()
            continue
        elif new_help == 'SHOWALL': #Show All lists
            show_lists()
            continue
        elif new_help == 'GROCERY':
            show_glist()
            continue
        elif new_help == 'SHOPPING':
            show_slist()
            continue
