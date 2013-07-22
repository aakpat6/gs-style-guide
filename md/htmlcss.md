HTML/CSS
==========

------------------------

HTML
----

#### Protocols
Never specify a protocol when using resources. This enables compatibility with both `http:` and `https:`, as well as prevents small bugs and offers small performance increases.
```html
<!-- GOOD -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- BAD -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
```

#### Indentation
Use two spaces to indent. Always indent inner blocks of code, and indent everything inside an element. Do not use tabs.
```html
<body>
  <ul>
    <li>1</li>
    <li>2</li>
    <li>3</li>
  </ul>
</body>
```

#### Capitalization
Only use lowercase. This improves readability across the code base.
```html
<!-- GOOD -->
<a href=""></a>
<!-- BAD -->
<A HREF=""></A>
```

#### Doctype
Always use the HTML5 doctype:
```html
<!doctype html>
```

#### Semantics
Use the elements for the purpose they were intended for. If you want to make a paragraph, use the `p` element.

Do not mix layout and functionality; i.e. do not put Javascript code directly inside tags.
```html
<!-- BAD -->
<p onclick="alert('hi');">Say hi.</p>
```

Do not mix layout and presentation; i.e. do not put a `style` attribute directly on HTML tags.
```html
<!-- BAD -->
<p style="background-color: #0099dd;">Hello.</p>
```

#### Types
Do not specify `type` attributes on scripts and stylesheets. The correct way to include these is:
```html
<link rel="stylesheet" href="css/style.css">
<script src="js/main.js"></script>
```

#### Quotations
Use double quotes (`"`) when specifying values for attributes in tags, instead of single quotes (`'`).


CSS
---

#### Semicolons
Use semicolons after every style declaration.

#### Whitespace
Place an extra blank line between rules. Each selector for a rule should be on a new line. Each style declaration should itself be on a new line.

Use a space after the colon, but not before the colon, for every declaration.

#### Indentation
Use two spaces to indent inside each block.

#### Colors
Prefer to use the shortest string possible when using colors; so, `#ff0` is preferred to `#ffff00`. Use lowercase when using hex color selectors.

If using a precompiler such as LESS, use a variable for each color in use, instead of hardcoding colors into the LESS declarations.

#### Shorthand
Prefer shorthand properties to multiple properties. They increase readability of the styles.
More documentation about shorthand properties can be found at the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties).

#### Quotations
Use single quotes for CSS when specifying property values.

#### Naming
Class and ID names should be lowercase and hyphenated. They should become more specific from left to right, e.g. `btn-user-edit`.

#### Example
````html
body {
  background-color: #fff;
}

h1,
h2 {
  color: #a45eb3;
  border: 1px solid #f00;
}
```
