SetBatchLines, -1
#SingleInstance, force
#NoTrayIcon
#Include %A_ScriptDir%\..\export.ahk
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

expect.label("multiple groups")
expect.test(ngram.generate(["mary", "had", "a", "little", "lamb"], [1, 4]), [[["mary"], ["had"], ["a"], ["little"], ["lamb"]], [["mary", "had", "a", "little"], ["had", "a", "little", "lamb"]]])

; wrap up
expect.final()
expect.fullReport()
expect.writeResultsToFile()
exitApp
