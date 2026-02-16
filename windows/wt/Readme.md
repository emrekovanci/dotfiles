example issue: https://github.com/microsoft/terminal/issues/3483

CSI u Protocol Specification
\u001b[ + key id + ; + modifier + u
https://sw.kovidgoyal.net/kitty/keyboard-protocol/

escape codes like \x1b must be written as \u001b: https://learn.microsoft.com/en-us/windows/terminal/customize-settings/actions#send-input

linux "showkey -a"
