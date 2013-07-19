Javascript
==========

------------------------

Language
--------

#### Variables
Always declare variables with `var`. If a variable is declared without `var`, it gets placed in the global namespace, and this can lead to issues with collisions down the line.

#### Semicolons
Always use semicolons. This prevents Javascript from having to guess where the semicolons are supposed to go.
Semicolons should be placed after every statement, but not after function declarations.
```javascript
var x = 4; // Semicolon here
var add = function(a,b) {
  return a + b; // Semicolon here
}; // Semicolon here

function square(n) {
  return n * n;
} // Not here
```

#### Functions in Functions
Feel free to write functions inside other functions. However, you should only use function *declarations* at top level.
In blocks, use a `var` declaration assigned to a function value.
```javascript
function f(x) {
  var g = function(y) {
    return 3;
  };
}
```

#### Wrappers for Primitives
Don't use wrappers for primitive types. Typecasting is allowed, i.e. `var x = Boolean(0)`, but do not do `var x = Boolean(false)`.
This can be nice for `number`, `string`, and `boolean`, which are the primitives of Javascript.

#### Delete
Avoid using the `delete` keyword in favor of `obj.prop = null`. It improves performance. The exception is obviously if you want to change the value of `key in obj`.

#### For Loops
Always use a traditional `for` loop when iterating. It simplifies the code and makes bugs easier to see.
Using a traditional `for` loop also eliminates problems when dealing with the prototype.

#### Long Strings
Do not use multiline string literals. Use concatenation to create large strings, if you must.
```javascript
var s = 'This is the first sentence of a really long string. ' +
        'This is the second sentence of the really long string.';
```

#### Arrays and Objects
When constructing arrays and objects, use literals, not constructors.
```javascript
var obj = {a: 5, b: 6}
var arr = [1, 1, 2, 3, 5, 8];
```

------------------------

Style
------

#### Naming
In Javascript, the naming scheme is as follows:

Type | Name
:----- | :-----
File | `filename.js`
Namespace | `NamespaceName`
Constant | `CONSTANT_NAME`
Function | `functionName`
Variable | `variableName`

We use a `trailingUnderscore_` to distinguish those functions and properties that should be private.

Optional function arguments should be prefixed with `opt_` so as to let the caller know that the argument is optional. If a function has a variable number of arguments, the last argument should be `var_args`.

Filenames should always be only lowercase. You may include either `_` or `-` in the filenames if you so choose.

#### Formatting
We use standard C and C++ style formatting as shown below. We use two spaces for indentation, never use tabs.
```javascript
if (condition) {
  // Do something
} else {
  // Do something else
}
```
Always start a `{` on the same line as the thing that it links to.

Multiline objects and arrays are formatted in the same way as other blocks. Never align the values in an object.
```javascript
var obj = {
  a: 4
  other_key: 'other_value'
};
var arr = [
  'one of the strings',
  'another string'
];
```

#### Parentheses and Quotes
Use parentheses only when required. Never use parentheses next to a keyword such as `return` or `typeof`.

Prefer `'` to `"` simply because it improves consistency and makes it easier to write HTML in Javascript strings.

#### Comments
You should write comments.
```javascript
/**
 * Function comments should be written like this.
 * @param {string} s The string to output.
 */
function output(s) {
  console.log(s); // End of line comments should be written like this.
}
```
Start comments with a capital letter and end them with periods, just like sentences.

#### Tips
##### Booleans
In boolean expressions, the following are all 'falsey':

- `null`
- `undefined`
- `0`
- `' '`

However, beware that these are the *only* falsey things.
##### Ternary Operator
Use of the ternary operator is encouraged if it doesn't impair readability. The following two snippets are equivalent:
```javascript
if (condition) {
  x = 2;
} else {
  x = 3;
}
```
```javascript
x = condition ? 2 : 3;
```
The second is clearly more succint and easier to read; thus, it is preferred.

##### `&&` and `||`
The operators `&&` and `||` short circuit, and evaluate to the last evaluated value.
We can use this to our advantage to initialize variables that may be uninitialized, and create default values:
```javascript
var x = x || {}; // Will set x to {} but only if x has not been initialized yet.
```

