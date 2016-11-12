set fileList to (choose file with prompt "Choose files" with multiple selections allowed)

repeat with x from 1 to (count fileList)
   set item x of fileList to (POSIX path of (item x of fileList))
end repeat

set AppleScript's text item delimiters to "\n"
return fileList as string
