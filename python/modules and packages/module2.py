#modules and packages

'''module
a file containing python code (function, variables, classes)
it allows code reuse and organization

packages:
a package is a directory of modules with an
__init__.py file, enabling hierarchy

creating a module: a python file (.py) with funtions or vairable

using a module use import module_name or 
from module_name import _ to access its contents
'''


import math
import random 

#those are inbuild modules provided by python 

import math_utils #user defined module

a = math_utils.add(20,30) #accessing funtions using . operator after module name
print(a)

#we can import only selected functions

from math_utils import sub

b = math_utils.sub(3,4)
print(b)

#giving alias to module

import math_utils as mu

c = mu.sub(10,3)
print(c)

from math_utils import sub, add #for selecting multiple funtions

from math_utils import * #to accessing all funtions

 

# packages:
# a package is a directory of modules with an
# __init__.py file, enabling hierarchy

from my_packages import math_utils, string_utils

f= math_utils.add(34,5)
g = string_utils.to_upper('nachiket')

print(f,g)

#to only use specific funtion 
from my_packages.math_utils import add
from my_packages.string_utils import to_lower