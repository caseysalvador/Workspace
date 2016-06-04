def loop(items):
    #Code goes here
    for item in items:
        if item != 'STOP':
            print(item)
        elif item == 'STOP':
            break
        else:
            print("Please try again")
loop("brush")
