# ngram.ahk
A really small ngram generator for AutoHotkey.

[![npm](https://img.shields.io/npm/dm/ngram.ahk?style=for-the-badge&logo=npm)](https://www.npmjs.com/package/ngram.ahk)


## Installation

In a terminal or command line navigated to your project folder:

```bash
npm install ngram.ahk
```

In your code only export.ahk needs to be included:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include ngram.ahk\export.ahk

ngram := new ngram()

ngram.generate(["hello", "world", "foo", "bar"], 2)
; => [["hello", "world"], ["world", "foo"], ["foo", "bar"]]
```


## API

### .generate(value, length)

generates ngrams.

##### Arguments
1. value (String|Array): The value to generate ngrams from
2. expected (Number|Array): Optional (default `1`); the length of the ngrams to generate

##### Returns
(Array): returns all n-grams in an array

##### Example
```autohotkey
ngram.generate("string")
; => [["s"], ["t"], ["r"], ["i"], ["n"], ["g"]]

ngram.generate("string", 2)
; => [["s", "t"], ["t", "r"], ["r", "i"], ["i", "n"], ["n", "g"]]

array := strSplit("Time is an illusion. Lunchtime doubly so", " ")
ngram.generate(array, [1, 3])
; => [["Time"], ["is"], ["an"], ["illusion."], ["Lunchtime"], ["doubly"], ["so"]], [["Time", "is", "an"], ["is", "an", "illusion."], ["an", "illusion.", "Lunchtime"], ["illusion.", "Lunchtime", "doubly"], ["Lunchtime", "doubly", "so"]]
```
