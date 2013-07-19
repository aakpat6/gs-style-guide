Java
==========

We follow standard Java coding conventions. You can download an Eclipse autoformatter [here](assets/android-formatting.xml).

------------------------

Language
--------

#### Exceptions
Always handle exceptions correctly. Never simply handle the generic `Exception`, as this could end up catching exceptions that were thrown further up than you realize.

When handling exceptions, you should do something with the exception, even if you simply log the exception. Your `catch` blocks should not be empty.

#### Imports
Always fully qualify all imports. Never have unused imports. It is easiest to simply use the import organizer that is built into your IDE.

```java
import java.util.ArrayList; // GOOD
import java.util.*; // BAD
```

#### Classes
All class variables should be `private`. Use `get` and `set` methods to access and modify these variables. The methods should be named with standard `get` and `set` standards.

```java
class MyClass {
  private int foo;

  public int getFoo() {
    return foo;
  }

  public void setFoo(int f) {
    foo = f;
  }
}
```

#### Increment and Decrement
Never put increment and decrement on the same line as other code. Since this makes `i++` and `++i` equivalent, there is no reason to use the latter. Therefore, you should only use post-increment and decrement.

#### Loops
Never use `do..while` loops. They are confusing, and the logic is at the end, making them less readable.

Avoid using `break` and `continue` in loops, as they decrease readability.

------------------------

Style
------

#### Naming
The naming convention is as follows:

Type | Name
:----- | :-----
Class | `ClassName`
Field | `fieldName`
Constant | `CONSTANT_NAME`

Treat acronyms as if they are words, i.e. `XmlHttpRequest` instead of `XMLHTTPRequest`.

#### Indentation
Use 4 spaces to indent blocks.

Use 8 spaces for hanging indents.

#### TODO
Use `TODO:` comments for temporary code, or code that is a hacked solution. Clearly write what to fix, and how important it is to fix it.

#### Comments
Use standard Javadoc comments to document functions and methods. Use end of line comments for statements. Comments should start with a capital letter and end with a period.

```java
/**
 * Does X.
 *
 * @param number The input number
 */
public void foo(int number) {
  bar(x); // Do things.
}
```
