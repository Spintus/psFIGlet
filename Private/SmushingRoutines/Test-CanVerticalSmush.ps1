function Test-CanVerticalSmush
{
    param
    (
        [string]    $txt1,
        [string]    $txt2,
        [HashTable] $opts
    )

    if ($opts['fittingRules']['vLayout'] -eq $FULL_WIDTH)
    {
        'invalid'
        return
    }

    $len        = [System.Math]::Min($txt1.Length, $txt2.Length)
    $endSmush   = $false
    $validSmush = $null

    if ($len -eq 0)
    {
        'invalid'
        return
    }

    for ($i = 0; $i -lt $len; $i++)
    {
        $ch1 = $txt1.Substring($i, 1)
        $ch2 = $txt2.Substring($i, 1)

        if ($ch1 -ne ' ' -and $ch2 -ne ' ')
        {
            switch ($opts['fittingRules']['vLayout'])
            {
                $FITTING {'invalid'; return}
                $SMUSHING {'end'; return}
                default
                {
                    if (vRule5_Smush $ch1 $ch2)
                    {
                        $endSmush = if ($endSmush)
                        {
                            $endSmush
                        }
                        else
                        {
                            $false
                        }

                        continue
                    }

                    $validSmush = $false
                    $validSmush = if ($opts['fittingRules']['vRule1']) {vRule1_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush = if (-not $validSmush -and $opts['fittingRules']['vRule2']) {vRule2_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush = if (-not $validSmush -and $opts['fittingRules']['vRule3']) {vRule3_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush = if (-not $validSmush -and $opts['fittingRules']['vRule4']) {vRule4_Smush $ch1 $ch2} else {$validSmush}
                    $endSmush = $true

                    if (-not $validSmush) {'invalid'; return}
                }
            }
        }
    }

    if ($endSmush)
    {
        'end'
    }
    else
    {
        'valid'
    }
}
