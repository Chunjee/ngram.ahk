SetBatchLines, -1
#Requires autohotkey v1.1
#SingleInstance, force
#NoTrayIcon

#Include %A_ScriptDir%\..\ngram.ahk
#Include %A_ScriptDir%\..\node_modules
#Include expect.ahk\export.ahk

expect := new expect()
ngram := new ngram()

expect.group(".generate")
expect.label("array input")
expect.test(ngram.generate(["hello", "world", "foo", "bar"], 2), [["hello", "world"], ["world", "foo"], ["foo", "bar"]])

expect.label("string input")
expect.test(ngram.generate("mississipi"), [["m"], ["i"], ["s"], ["s"], ["i"], ["s"], ["s"], ["i"], ["p"], ["i"]])
expect.test(ngram.generate("mississipi", 2), [["m", "i"], ["i", "s"], ["s", "s"], ["s", "i"], ["i", "s"], ["s", "s"], ["s", "i"], ["i", "p"], ["p", "i"]])
expect.label("string input with custom separator")
expect.test(ngram.generate("world,peace", 2, ","), [["world", "peace"]])
expect.test(ngram.generate("world,peace", 1, ","), [["world"], ["peace"]])

expect.label("multiple groups")
expect.test(ngram.generate(["mary", "had", "a", "little", "lamb"], [1, 4]), [[["mary"], ["had"], ["a"], ["little"], ["lamb"]], [["mary", "had", "a", "little"], ["had", "a", "little", "lamb"]]])

expect.label("multiple groups 2")
inputArr := strSplit("Time is an illusion. Lunchtime doubly so", " ")
array := ngram.generate(inputArr, [1, 3])
expect.test(array, [[["Time"], ["is"], ["an"], ["illusion."], ["Lunchtime"], ["doubly"], ["so"]], [["Time", "is", "an"], ["is", "an", "illusion."], ["an", "illusion.", "Lunchtime"], ["illusion.", "Lunchtime", "doubly"], ["Lunchtime", "doubly", "so"]]])

; wrap up
expect.final()
expect.fullReport()
expect.writeResultsToFile()
exitApp
