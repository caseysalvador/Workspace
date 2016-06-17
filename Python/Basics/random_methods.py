# Using the randint method

import random

def random_item(iterable):
  return iterable[random.randint(0,len(iterable)-1)]
