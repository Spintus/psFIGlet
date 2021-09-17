Credit for the implementations of the FIGlet algorithms which
have been rewritten in PowerShell here belongs to Patrick Gillespie
(patorjk) for his excellent figlet.js project
(https://github.com/patorjk/figlet.js), without which I likely
would never have gotten so far on this.

I have simply rewritten his JS into PowerShell, broken stuff out
into a more navigable module format, and made stuff like function calls
and internal logic more "PowerShell-ey".

If you're interested in FIGlet and FIGDrivers, I highly recommend
checking out figlet.js and the accompanying website which uses it:
http://patorjk.com/software/taag/

psFIGlet (a FIGDriver for FIGlet fonts)
By Will Marcum (marcumwill@gmail.com)
Originally Written For: Boulder Imaging LLC.
License: MIT (with this header staying intact)

This PowerShell code aims to fully implement the FIGlet spec.
Full FIGlet spec: http://www.jave.de/docs/figfont.txt
