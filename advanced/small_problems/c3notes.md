# M1
## 1listening
- `Array#puts` prints each element on a new line
  - flattens and removes nested array brackets
  - removes quote marks
  - keeps nested hash formatting
## 2 textanalyzer
- always close your files
  - avoid memory leak
- basic pattern is open-use-close
- useful file methods in `File` and `IO` classes

## 3-5 parameters
- `*` tells Ruby to treat params from that point in the array up until next series of args as its own array
  -  `|*produce, wheat|`
    - all get put into `produce` except last one
  - `|apples, *vegetables, wheat|`
    - all get put into `vegetables` except first and last
  - etc
## 6 method to proc
- `Integer#to_s` takes base as arg
  - eg convert to base 8 with int.to_s(8).to_i
- methods can be referenced by symbols
  - method(symbol) returns the method with that name as a `Method` object
    - this can be converted to a proc
- using `&` with a Proc arg passed into a method converts that Proc arg to block
  - if not a Proc, calls `to_proc`
# Testing
- `assert_output` takes a block to see if arg matches output from block
  - remember to account for nuances, such as automatic `\n` with `puts`
- open and assign a file with `file_var = File.open('<filename>', '<mode>')`
  - access and assign contents with `content_var = file_var.read`
    - close with `file_var.close`
- don't mimic implementation of method in your test
  - test it using a different logic that you know works
- you want setup and teardown for file-related operations
