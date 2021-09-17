function Get-ParsedFont
{
    param
    (
        [string]   $fontName,
        [string[]] $data
    )

    $data                = $data.Replace("`r`n", "`n").Replace("`r", "`n")
    $figFonts[$fontName] = @{}

    [System.Collections.ArrayList]$lines = $data.Split("`n")
    $headerData                          = $lines[0].Split(' ')
    $lines                               = $lines[1..($lines.Count - 1)]
    $figFont                             = $figFonts[$fontName]
    $opts = @{
        hardBlank       = $headerData[0].Substring(5, 1)
        height          = [int]::Parse($headerData[1])
        baseline        = [int]::Parse($headerData[2])
        maxLength       = [int]::Parse($headerData[3])
        oldLayout       = [int]::Parse($headerData[4])
        numCommentLines = [int]::Parse($headerData[5])
        printDirection  = if ($headerData.Length -gt 6) {[int]::Parse($headerData[6])} else {0}
        fullLayout      = if ($headerData.Length -gt 7) {[int]::Parse($headerData[7])} else {$null}
        codeTagCount    = if ($headerData.Length -gt 8) {[int]::Parse($headerData[8])} else {$null}
    }

    $opts['fittingRules'] = $(Get-SmushingRules $opts['oldLayout'] $opts['fullLayout'])
    $figFont['options']   = $opts

    # Error check
    filter isNumeric()
    {
        return $_ -is [byte] -or
               $_ -is [int16] -or
               $_ -is [int32] -or
               $_ -is [int64] -or
               $_ -is [sbyte] -or
               $_ -is [uint16] -or
               $_ -is [uint32] -or
               $_ -is [uint64] -or
               $_ -is [float] -or
               $_ -is [double] -or
               $_ -is [decimal]
    }

    if ($opts['hardBlank'].Length -ne 1 -or
        -not $($opts['height']          | isNumeric) -or
        -not $($opts['baseline']        | isNumeric) -or
        -not $($opts['maxLength']       | isNumeric) -or
        -not $($opts['oldLayout']       | isNumeric) -or
        -not $($opts['numCommentLines'] | isNumeric))
    {
        throw 'FIGlet header contains invalid values.'
    }

    $charNums = New-Object System.Collections.ArrayList
    for ($i = 32; $i -le 126; $i++)
    {
        $charNums.Add($i) | Out-Null
    }
    196, 214, 220, 228, 246, 252, 223 | ForEach-Object {$charNums.Add($_)} | Out-Null

    # Error check - validate there are enough lines in file
    if ($lines.Count -lt ($opts['numCommentLines'] + ($opts['height'] * $charNums.Count)))
    {
        throw 'FIGlet file is missing data.'
    }

    $parseError = $false

    $figFont['comment']  = $($lines[0..($opts['numCommentLines'] - 1)] -join "`n")
    $lines               = $lines[$opts['numCommentLines']..($lines.Count - 1)]
    $figFont['numChars'] = 0

    while ($lines.Count -gt 0 -and $figFont['numChars'] -lt $charNums.Count)
    {
        $cNum           = $charNums[$figFont['numChars']]
        $figFont[$cNum] = $lines[0..($opts['height'] - 1)]
        $lines          = $lines[$opts['height']..($lines.Count - 1)]

        # Remove end sub-chars
        for ($i = 0; $i -lt $opts['height']; $i++)
        {
            if (-not $(try {$figFont[$cNum][$i].GetType()} catch {$false}))
            {
                $figFont[$cNum][$i] = ''
            }
            else
            {
                $endCharRegex       = $figFont[$cNum][$i].Substring($figFont[$cNum][$i].Length - 1, 1) + '+$'
                $figFont[$cNum][$i] = $figFont[$cNum][$i] -replace $endCharRegex, ''
            }
        }

        $figFont['numChars']++
    }

    # Now check for additional FIGchars
    :parseLoop while ($lines.Count -gt 0)
    {
        $cNum = ($lines[0] -split ' ')[0]
        if ($lines.Count -gt 1)
        {
            $lines = $lines[1..($lines.Count - 1)]
        }

        $cNum = switch -Regex ($cNum)
        {
            '^0[xX][0-9a-fA-F]+$'  {[System.Convert]::ToInt32($cNum, 16); break}
            '^0[0-7]+$'            {[System.Convert]::ToInt32($cNum, 8) ; break}
            '^[0-9]+$'             {[System.Convert]::ToInt32($cNum, 10); break}
            '^-(?<num>0[xX][0-9a-fA-F]+)$' {
                ([int32] $Matches['num']) * -1
                #[System.Convert]::ToInt32($cNum, 16)
                break
            }
            default
            {
                if ($cNum -eq '')
                {
                    break parseLoop
                }

                # Something's wrong
                Write-Warning 'Invalid data:' + $cNum
                $parseError = $true
                break parseLoop
            }
        }

        $figFont[$cNum] = $lines[0..($opts['height'] - 1)]
        $lines          = $lines[$opts['height']..($lines.Count - 1)]

        # Remove end sub-chars
        for ($i = 0; $i -lt $opts['height']; $i++)
        {
            if (-not $(try {$figFont[$cNum][$i].GetType()} catch {$false}))
            {
                $figFont[$cNum][$i] = ''
            }
            else
            {
                $endCharRegex       = $figFont[$cNum][$i].Substring($figFont[$cNum][$i].Length - 1, 1) + '+$'
                $figFont[$cNum][$i] = $figFont[$cNum][$i] -replace $endCharRegex, ''
            }
        }

        $figFont['numChars']++
    }

    # Error check
    if ($parseError)
    {
        throw 'Error parsing data.'
    }

    $opts
}
