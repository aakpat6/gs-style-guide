General
=======

-----------------------

General Style
-------------
#### Files
Filenames are lowercase, except in the case of Java.

Files end in a newline - i.e. there is a blank line at the end of the file when viewed in a text editor.

#### Names
Be descriptive and *consistent* when naming variables and files, as this will greatly reduce the workload of the person reading your code. To that end, the text shown to the user should correlate to the internal variable names associated with that text, to allow for easier maintenance. For example, if you have a button that says "Jump", then the associated function should be called `jump()` instead of `hop()` or something confusing like that.


#### Comments
Document any nontrivial function with a description of what it does. Guidelines for the comments themselves appear in each language's style guide.

Document any nontrivial file (read: more than one function) with a description of what it does.

Do not use `@author` annotations or write your name at the top of a file. Doing this can be confusing, because most files are modified by multiple people. Instead, consult a `git blame` if you want to know who wrote a specific piece of code.

Git
---
#### Commits
Commit messages are in the imperative, so as to follow the guidelines set by the default `merge` and `rebase` commit messages, e.g. `Add functionality` instead of `Added functionality`.

Commit messages describe a feature that was implemented in that commit first. This message must be short (less than 80 characters). If you wish to elaborate, place a blank line, and then elaborate afterwards.

#### Push and pull
Pull before beginning work. If Git auto-merges your code, then call `git rebase` in order to fast forward your commits before push. If you have to merge manually, create a new commit for it and do not `rebase`. Test your code after merging to make sure it still works.

#### Issues
We use Github issues to track things that need to be done. If you create a commit that either adds progress to, or completes an issue, reference that issue in your commit message.

- If you have made progress, then add `Ref #<issue>.` to your commit message, after your main message.
- If you have completed the task in the issue, then add `Close #<issue>.` or `Fix #<issue>.` depending on whether it was a feature addition or a bugfix.

#### Example
```
Add ability to view all users.

Pressing on the big blue button lets the admin see all the users of the application.
Ref #13.
```
