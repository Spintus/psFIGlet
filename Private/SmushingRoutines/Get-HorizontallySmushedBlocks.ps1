function Get-HorizontallySmushedBlocks
{
    param
    (
        [string[]]  $textBlock1,
        [string[]]  $textBlock2,
        [int]       $overlap,
        [HashTable] $opts
    )

    $outputFig = @()

    for ($i = 0; $i -lt $opts['height']; $i++)
    {
        $txt1 = $textBlock1[$i]
        $txt2 = $textBlock2[$i]
        $len1 = $txt1.Length
        $len2 = $txt2.Length
        $overlapStart = $len1 - $overlap
        $piece1 = $txt1.Substring(0, [System.Math]::Max(0, $overlapStart))
        $piece2 = ''

        # Determine overlap piece
        $seg1 = $txt1.Substring([System.Math]::Max(0, $len1 - $overlap), $overlap)
        $seg2 = $txt2.Substring(0, [System.Math]::Min($overlap, $len2))

        for ($j = 0; $j -lt $overlap; $j++)
        {
            $ch1 = if ($j -lt $len1) {$seg1.Substring($j, 1)} else {' '}
            $ch2 = if ($j -lt $len2) {$seg2.Substring($j, 1)} else {' '}

            $piece2 += if ($ch1 -ne ' ' -and $ch2 -ne ' ')
            {
                switch ($opts['fittingRules']['hLayout'])
                {
                    $FITTING  {uni_Smush $ch1 $ch2 $opts['hardBlank']}
                    $SMUSHING {uni_Smush $ch1 $ch2 $opts['hardBlank']}
                    default
                    {
                        # Controlled Smushing
                        $nextCh = ''
                        $nextCh = if (-not $nextCh -and $opts['fittingRules']['hRule1']) {hRule1_Smush $ch1 $ch2 $opts['hardBlank']} else {$nextCh}
                        $nextCh = if (-not $nextCh -and $opts['fittingRules']['hRule2']) {hRule2_Smush $ch1 $ch2 $opts['hardBlank']} else {$nextCh}
                        $nextCh = if (-not $nextCh -and $opts['fittingRules']['hRule3']) {hRule3_Smush $ch1 $ch2 $opts['hardBlank']} else {$nextCh}
                        $nextCh = if (-not $nextCh -and $opts['fittingRules']['hRule4']) {hRule4_Smush $ch1 $ch2 $opts['hardBlank']} else {$nextCh}
                        $nextCh = if (-not $nextCh -and $opts['fittingRules']['hRule5']) {hRule5_Smush $ch1 $ch2 $opts['hardBlank']} else {$nextCh}
                        $nextCh = if (-not $nextCh -and $opts['fittingRules']['hRule6']) {hRule6_Smush $ch1 $ch2 $opts['hardBlank']} else {$nextCh}
                        $nextCh = if (-not $nextCh) {uni_Smush $ch1 $ch2 $opts['hardBlank']} else {$nextCh}
                        $nextCh
                    }
                }
            }
            else
            {
                uni_Smush $ch1 $ch2 $opts['hardBlank']
            }
        }

        $piece3 = if ($overlap -ge $len2)
        {
            ''
        }
        else
        {
            $txt2.Substring($overlap, [System.Math]::Max(0, $len2 - $overlap))
        }

        $outputFig += $piece1 + $piece2 + $piece3
    }

    $outputFig
}
