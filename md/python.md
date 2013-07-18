Python Guide
=======

Language
--------

### Imports
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

### Exceptions
Use exceptions if you need to signal something bad has happened. Always raise an exception with `raise MyException` or `raise MyException('message')`, never in any other way.

Always catch specific exceptions; never use `except:` or `except Exception`. If you would like to capture the exception, you should use `except MyException as e`, not `except MyException, e`.

Make sure to put as little code in your `try` block as possible. You don't want exceptions to be caught silently unless you know exactly what you're handling them with.

### Globals
Try not to use global variables (those that are declared at the top level of a module). There are some exceptions:

- Constants: `REFRESH_RATE = 3.2`
- Caching values from multiple function calls.
- Default options, if writing a script.

### Functions
Try to minimize the scope of functions if possible. Thus, nested or local functions are perfectly fine, as shown below.
```python
def f(L):
  def g(n):
    # Do very complicated math
    return result
  return [g(x) for x in L]
```

### List and Dictionary Comprehensions
You should use list and dictionary comprehensions, *except* in the cases that using a comprehension lowers the readability of the code instead of improving it. A good rule of thumb is that a comprehension should fit easily in one line. If the comprehension gets too complicated to read easily, simply use `for` loops and construct the data structure yourself.

Comprehensions are greatly preferred to using functional programming tools such as `map` and `filter`.

### Iteration and Membership
When iterating or checking membership, you should use the keywords `in` and `not in`, as opposed to using the less well known and harder to read alternatives, such as iterating through `dictionary.keys()` or checking `dictionary.has_key()`.

### Anonymous Functions
Using `lambda` functions can very much simplify code writing, especially when dealing with data structures. However, make sure the anonymous functions are still easily readable.

### Ternary Operator
The ternary operator exists in Python:
```python
x = 10 if y > 2 else 4
```
Use of the ternary operator cuts down on code length, so it is OK to use it. However, if the condition is long or it starts to impair readability, switch to a traditional `if...else` statement.

### Default and Keyword Arguments
In Python we can specify default arguments for functions. Doing this is fine, as long as the function calls refer to these arguments by name. Never use mutable objects as default arguments, as they are only loaded once.
```python
def f(a, b=2): # GOOD
f(1, b=3) # GOOD
f(1, 4) # BAD

def g(a, b=[]) # BAD
```

### True/False
Whenever possible, you should use the implicit value of `False` that is assigned to the values `None`, `0`, `""`, `[]`, and `{}`. This reduces the amount of code that you have to write in condition evaluations. So, `if not my_list:` is better than `if my_list != []`.

In the case of integers, you may compare to `0` instead of simply checking for an implicit `False`.

### None
When checking for equality with `None`, you should use the `is` keyword.
```python
if a is None: # GOOD
if a == None: # BAD
if not a: # GOOD, if you don't just want to catch None
```

Style
-----

### Indentation
Use two spaces for indentation in all Python files. Never use tab characters, and never mix tabs and spaces.

In case of hanging indents, align to the opening delimiter.
```python
def function_with_a_big_name(really_long_argument_name, another_long_argument_name_again,
                             a_third_argument_name, the_very_last_argument):
```

### Line Length
You should try to keep line length to less than 100 characters.

### Parentheses
Use parentheses only when you need to. A simple `if` statement does not need parentheses around the condition.

You may use parentheses if you need to have a multiline command, in which case you should indent the following lines to the opening delimiter.

### Spaces
Use spaces after commas, never before commas. Never use commas immediately before or after a delimiter such as `(`, `)`, `[`, `]`, etc.

Binary operators should have spaces on either side, e.g. `x > y`.

Do not use spaces on either side of the `=` when referring to default or keyword arguments, e.g. `f(a, b=3)`.
