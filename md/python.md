Python
=======

------------------------------------------

Language
--------

#### Imports
Never use a wildcard import. Using a wildcard import could easily result in namespace collisions.
Only import modules or packages.
```python
import module # GOOD
from module import * # BAD
from OpenGL import OpenGL # GOOD
```
If a name is unwieldy or annoying to use, you may alias the import. You should also alias the import if you are importing two modules with the same name.
```python
import really_annoying_and_long_module_name as module # GOOD
```

#### Exceptions
Use exceptions if you need to signal something bad has happened. Always raise an exception with `raise MyException` or `raise MyException('message')`, never in any other way.

Always catch specific exceptions; never use `except:` or `except Exception`. If you would like to capture the exception, you should use `except MyException as e`, not `except MyException, e`.

Make sure to put as little code in your `try` block as possible. You don't want exceptions to be caught silently unless you know exactly what you're handling them with.

#### Globals
Try not to use global variables (those that are declared at the top level of a module). There are some exceptions:

- Constants: `REFRESH_RATE = 3.2`
- Caching values from multiple function calls.
- Default options, if writing a script.

#### Functions
Minimize the scope of functions. Thus, nested or local functions are perfectly fine, as shown below.
```python
def f(L):
  def g(n):
    # Do very complicated math
    return result
  return [g(x) for x in L]
```

#### List and Dictionary Comprehensions
You should use list and dictionary comprehensions, *except* in the cases that using a comprehension lowers the readability of the code instead of improving it. A comprehension should fit easily in one line. If the comprehension gets too complicated to read easily, simply use `for` loops and construct the data structure yourself.

Comprehensions are greatly preferred to using functional programming tools such as `map` and `filter`.

#### Iteration and Membership
When iterating or checking membership, you should use the keywords `in` and `not in`, as opposed to using the less well known and harder to read alternatives, such as iterating through `dictionary.keys()` or checking `dictionary.has_key()`.

#### Anonymous Functions
Using `lambda` functions can very much simplify code writing, especially when dealing with data structures. However, make sure the anonymous functions are still easily readable.

#### Default and Keyword Arguments
In Python we can specify default arguments for functions. Doing this is fine, as long as the function calls refer to these arguments by name. Never use mutable objects as default arguments, as they are only loaded once.
```python
def f(a, b=2): # GOOD
f(1, b=3) # GOOD
f(1, 4) # BAD

def g(a, b=[]) # BAD
```

#### True/False
Whenever possible, you should use the implicit value of `False` that is assigned to the values `None`, `0`, `""`, `[]`, and `{}`. This reduces the amount of code that you have to write in condition evaluations. So, `if not my_list:` is better than `if my_list != []`.

In the case of integers, you may compare to `0` instead of simply checking for an implicit `False`.

#### None
When checking for equality with `None`, you should use the `is` keyword.
```python
if a is None: # GOOD
if a == None: # BAD
if not a: # GOOD, if you don't just want to catch None
```

#### Files
When using a file, be sure to close the file afterwards.
A good way to avoid having to remember to close is to do this:
```python
with open('example.txt') as f:
  print f.readlines()
```
After the `with` block is executed, `f` is automatically closed.

#### Strings
It is better to use the `%` operator to format strings, using a `printf` style of formatting.
```python
s = 'My name is %s' % 'Bob'
print s # Outputs 'My name is Bob'
```
Note that if you have a lot of data, you can do this with a `dict` also:
```python
s = 'My name is %(name)s and I am %(age)d years old.' % {'name': 'Bob', 'age': 27}
print s # Outputs 'My name is Bob and I am 27 years old'
```

When performing string concatenations, especially repeatedly, it is preferred to use the `string.join` function over manual concatenation with the `+` operator, as it is significantly faster. Below are increasingly faster and cleaner ways to create a string of the first 1000 natural numbers. Strings are immutable, and lists are mutable. So, if you're changing the value of something, you should change the value of the mutable.
```python
""" Method 1 (bad) """
s = ''
for i in xrange(1000):
  s += str(i)

""" Method 2 (good) """
a = []
for i in xrange(1000):
  a.append(str(i))
s = ''.join(a)

""" Method 3 (best) """
s = ''.join([str(i) for i in xrange(1000)])
```

#### Ranges
Prefer `xrange` over `range` when iterating. This is quicker, because the whole list doesn't have to be generated befor eiteration can begin.
Only use `range` if you actually want to use the list for some reason.

----------------------------------------------------------

Style
-----

#### Naming
In Python, the naming scheme is as follows:

Type | Name
:----- | :----
Package | `package_name`
Module | `module_name`
Class | `ClassName`
Exception | `ExceptionName`
Function | `function_name()`
Constant | `CONSTANT_NAME`

Anything not listed in the table should follow the `lower_case_underscore` convention.

We use a `_leading_underscore` to denote that a property, function, or class is meant to be used only internally. This is like a `protected` identifier in Java. Note that this does not actually prevent other modules from accessing the property, it simply serves as a signal to the developer.

#### Indentation
Use two spaces for indentation in all Python files. Never use tab characters, and never mix tabs and spaces.

In case of hanging indents, align to the opening delimiter.
```python
def function_with_a_big_name(really_long_argument_name, another_long_argument_name_again,
                             a_third_argument_name, the_very_last_argument):
```

#### Comments
You should comment your code if it's nonobvious what it does at first sight.
When writing a docstring for a function, or a multiline comment, you should use the `"""` syntax for the start and end of the comment. Docstrings should contain a description of what the function does, as well as any necessary types that could help a user run the function.
```python
def mystery(x, n):
   """ Returns a list of length n with each entry as x """
   return [x for i in xrange(n)]
```
End of line comments or comments regarding a statement should use the `#` syntax.
```python
def mystery_redux(n):
  return [x ** 2 for x in xrange(n)] # Creates a list of squares of length n
```

#### Line Length
Keep line length to less than 100 characters.

#### Parentheses
Use parentheses only when you need to. A simple `if` statement does not need parentheses around the condition.

You may use parentheses if you need to have a multiline command, in which case you should indent the following lines to the opening delimiter.

#### Spaces
Use spaces after commas, never before commas. Never use commas immediately before or after a delimiter such as `(`, `)`, `[`, `]`, etc.

Binary operators should have spaces on either side, e.g. `x > y`.
Do not use spaces on either side of the `=` when referring to default or keyword arguments, e.g. `f(a, b=3)`.

Remove all trailing whitespace at the end of lines.

#### Main
Every module should be able to be imported quickly. To this end, any main code that is executed in a script should be placed inside an
`if __name__ == '__main__':` block.

#### Ternary Operator
The ternary operator exists in Python:
```python
x = 10 if y > 2 else 4
```
Use of the ternary operator cuts down on code length, so it is OK to use it. However, if the condition is long or it starts to impair readability, switch to a traditional `if...else` statement.

#### Imports
Imports should be placed into categories depending on where they came from.

