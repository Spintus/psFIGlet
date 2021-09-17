function Get-HorizontalSmushLength
{
    param
    (
        [string]    $txt1,
        [string]    $txt2,
        [HashTable] $opts
    )

    if ($opts['fittingRules']['hLayout'] -eq $FULL_WIDTH)
    {
        return 0
    }

    $len1 = $txt1.Length
    $len2 = $txt2.Length
    $maxDist = $len1
    $curDist = 1
    $breakAfter = $false
    $validSmush = $false

    if ($len1 -eq 0)
    {
        return 0
    }

    :distCal while ($curDist -le $maxDist)
    {
        $seg1 = $txt1.Substring($len1 - $curDist, $curDist)
        $seg2 = $txt2.Substring(0, [System.Math]::Min($curDist, $len2))

        for ($i = 0; $i -lt [System.Math]::Min($curDist, $len2); $i++)
        {
            $ch1 = $seg1.Substring($i, 1)
            $ch2 = $seg2.Substring($i, 1)

            if ($ch1 -ne ' ' -and $ch2 -ne ' ')
            {
                switch ($opts['fittingRules']['hLayout'])
                {
                    $FITTING
                    {
                        $curDist--
                        break distCal
                    }
                    $SMUSHING
                    {
                        if ($ch1 -eq $opts['hardBlank'] -or $ch2 -eq $opts['hardBlank'])
                        {
                            $curDist-- # Universal smushing doesn't smush hardblanks
                        }
                        break distCal
                    }
                    default
                    {
                        $breakAfter = $true
                        $validSmush = $false

                        $validSmush = if ($opts['fittingRules']['hRule1']) {hRule1_Smush $ch1 $ch2 $opts['hardBlank']} else {$validSmush}
                        $validSmush = if (-not $validSmush -and $opts['fittingRules']['hRule2']) {hRule2_Smush $ch1 $ch2 $opts['hardBlank']} else {$validSmush}
                        $validSmush = if (-not $validSmush -and $opts['fittingRules']['hRule3']) {hRule3_Smush $ch1 $ch2 $opts['hardBlank']} else {$validSmush}
                        $validSmush = if (-not $validSmush -and $opts['fittingRules']['hRule4']) {hRule4_Smush $ch1 $ch2 $opts['hardBlank']} else {$validSmush}
                        $validSmush = if (-not $validSmush -and $opts['fittingRules']['hRule5']) {hRule5_Smush $ch1 $ch2 $opts['hardBlank']} else {$validSmush}
                        $validSmush = if (-not $validSmush -and $opts['fittingRules']['hRule6']) {hRule6_Smush $ch1 $ch2 $opts['hardBlank']} else {$validSmush}
                        $script:validSmush = $validSmush

                        if (-not $validSmush)
                        {
                            $curDist--
                            break distCal
                        }
                    }
                }
            }
        }

        if ($breakAfter)
        {
            break
        }

        $curDist++
    }

    [System.Math]::Min($maxDist, $curDist)
}
