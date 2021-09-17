function Get-VerticallySmushedLines
{
    param
    (
        [string]    $line1,
        [string]    $line2,
        [HashTable] $opts
    )

    $len = [System.Math]::Min($line1.Length, $line2.Length)
    $result = ''

    for ($i = 0; $i -lt $len; $i++)
    {
        $ch1 = $line1.Substring($i, 1)
        $ch2 = $line2.Substring($i, 1)

        $result += if ($ch1 -ne ' ' -and $ch2 -ne ' ')
        {
            switch ($opts['fittingRules']['vLayout'])
            {
                $FITTING {uni_Smush $ch1 $ch2}
                $SMUSHING {uni_Smush $ch1 $ch2}
                default
                {
                    $validSmush = $false
                    $validSmush = if ($opts['fittingRules']['vRule5']) {vRule5_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush = if (-not $validSmush -and $opts['fittingRules']['vRule1']) {vRule1_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush = if (-not $validSmush -and $opts['fittingRules']['vRule2']) {vRule2_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush = if (-not $validSmush -and $opts['fittingRules']['vRule3']) {vRule3_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush = if (-not $validSmush -and $opts['fittingRules']['vRule4']) {vRule4_Smush $ch1 $ch2} else {$validSmush}
                    $validSmush
                }
            }
        }
        else
        {
            uni_Smush $ch1 $ch2
        }
    }

    $result
}
