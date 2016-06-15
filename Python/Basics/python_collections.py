#Python Collections

#adding to a list.

a_list = [1, 2, 3]
print("a1. " + str(a_list))

a_list.append([4, 5])
print("a2. " + str(a_list)) #list within a list

b_list = list(range(10))
print("b1. " + str(b_list))

b_list += [10, 11, 12]
print("b2. " + str(b_list)) #adding to the list

#.extend() method
b_list.extend(range(13, 21))
print("c1. " + str(b_list))

#.insert() method
c_list = list('acdf')
print("c1. " + c_list)

c_list.insert(1,'b')
print("c2. " + str(c_list))


c_list.insert(4,'e')
print("c3. " + str(c_list))
