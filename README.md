FIGlet.ps1 (a FIGDriver for FIGlet fonts)
By Will Marcum (marcumwill@gmail.com)
Originally Written For: Boulder Imaging LLC.
License: MIT (with this header staying intact)

This PowerShell code aims to fully implement the FIGlet spec.
Full FIGlet spec: http://www.jave.de/docs/figfont.txt

FIGlet fonts are actually kind of complex, which is why you will see
a lot of code about parsing and interpreting rules. The actual generation
code is pretty simple and is done near the bottom of the code.