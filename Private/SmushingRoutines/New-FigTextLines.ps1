function New-FigTextLines
{
    param
    (
        [string]    $txt,
        [HashTable] $figChars,
        [HashTable] $opts
    )

    $overlap        = 0
    $height         = $opts['height']
    $outputFigLines = @()
    $figWords       = @()

    $outputFigText = New-FigChar $height

    if ($opts['width'] -gt 0 -and $opts['whitespaceBreak'])
    {
        # List of characters is used to break in the middle of the word when word is longer.
        # $chars is array of characters with {$fig, $overlap} and $overlap is for whole word.
        $nextFigChars = @{
            chars   = @()
            overlap = $overlap
        }
    }

    if ($opts['printDirection'] -eq 1)
    {
        $arr = $txt.ToCharArray()
        [System.Array]::Reverse($arr)
        $txt = [System.String]::Concat($arr)
    }

    $len = $txt.Length
    for ($charIndex = 0; $charIndex -lt $len; $charIndex++)
    {
        $char        = $txt.Substring($charIndex, 1)
        $isSpace     = $char -match '\s'
        $figChar     = $figChars[[int][char]$char]
        $textFigLine = $null

        if ($figChar)
        {
            if ($opts['fittingRules']['hLayout'] -ne $FULL_WIDTH)
            {
                $overlap = 10000 # Value too high for overlap

                for ($row = 0; $row -lt $opts['height']; $row++)
                {
                    $overlap = [System.Math]::Min($overlap, $(Get-HorizontalSmushLength $outputFigText[$row] $figChar[$row] $opts))
                }

                $overlap = if ($overlap -eq 10000) {0} else {$overlap}
            }

            if ($opts['width'] -gt 0)
            {
                if ($opts['whitespaceBreak'])
                {
                    # Next character in last word ($figChars have same data as words)
                    $textFigWord = Join-FigArray $nextFigChars['chars'].Concat($(, @(@{ #!!! PUKE
                                    fig     = $figChar
                                    overlap = $overlap
                                }))) $height $opts

                    $textFigLine = Join-FigArray $figWords.Concat($(, @(@{ #!!! PUKE
                                    fig     = $textFigWord
                                    overlap = $nextFigChars['overlap']
                                }))) $height $opts

                    $maxWidth = Get-FigLinesWidth $textFigLine
                }
                else
                {
                    $textFigLine = Get-HorizontallySmushedBlocks $outputFigText $figChar $overlap $opts
                    $maxWidth    = Get-FigLinesWidth $textFigLine
                }

                if ($maxWidth -ge $opts['width'] -and $charIndex -gt 0)
                {
                    if ($opts['whitespaceBreak'])
                    {
                        $outputFigText = Join-FigArray $figWords[0..$figWords.Length - 1] $height $opts

                        if ($figWords.Length -gt 1)
                        {
                            $outputFigLines += $outputFigText
                            $outputFigText   = New-FigChar $height
                        }

                        $figWords = @()
                    }
                    else
                    {
                        $outputFigLines += $outputFigText
                        $outputFigText   = New-FigChar $height
                    }
                }
            }

            if ($opts['width'] -gt 0 -and $opts['whitespaceBreak'])
            {
                if (-not $isSpace -or $charIndex -eq $len - 1)
                {
                    $nextFigChars['chars'] += @{
                        fig     = $figChar
                        overlap = $overlap
                    }
                }

                if ($isSpace -or $charIndex -eq $len - 1)
                {
                    # Break long words
                    $tmpBreak = $null

                    while ($true)
                    {
                        $textFigLine = Join-FigArray $nextFigChars['chars'] $height $opts
                        $maxWidth    = Get-FigLinesWidth $textFigLine

                        if ($maxWidth -ge $opts['width'])
                        {
                            $tmpBreak        = Get-BrokenWord $nextFigChars['chars'] $height $opts
                            $nextFigChars    = @{chars = $tmpBreak['chars']}
                            $outputFigLines += $tmpBreak['outputFigText']
                        }
                        else
                        {
                            break
                        }
                    }

                    # Any leftovers
                    if ($maxWidth -gt 0)
                    {
                        if ($tmpBreak)
                        {
                            $figWords += @{
                                fig     = $textFigLine
                                overlap = 1
                            }
                        }
                        else
                        {
                            $figWords += @{
                                fig     = $textFigLine
                                overlap = $nextFigChars['overlap']
                            }
                        }
                    }

                    # Save space character and current overlap for smush in joinFigWords
                    if ($isSpace)
                    {
                        $figWords += @{
                            fig     = $figChar
                            overlap = $overlap
                        }
                        $outputFigText = New-FigChar $height
                    }

                    if ($charIndex -eq $len - 1)
                    {
                        # Last line
                        $outputFigText = Join-FigArray $figWords $height $opts
                    }

                    $nextFigChars = @{
                        chars   = @()
                        overlap = $overlap
                    }

                    continue
                }
            }

            $outputFigText = Get-HorizontallySmushedBlocks $outputFigText $figChar $overlap $opts
        }
    }

    # Special case when the last line would be empty
    # This may happen if text fits exactly $opts['width']
    if ($(Get-FigLinesWidth $outputFigText) -gt 0)
    {
        $outputFigLines += , @($outputFigText)
    }

    # Remove hardblanks
    if (-not $opts['showhardBlanks'])
    {
        for ($line = 0; $line -lt $outputFigLines.Count; $line++)
        {
            $len = $outputFigLines[$line].Length

            for ($row = 0; $row -lt $len; $row++)
            {
                $outputFigLines[$line][$row] = $outputFigLines[$line][$row].Replace($opts['hardBlank'], ' ')
            }
        }
    }

    $outputFigLines
}
