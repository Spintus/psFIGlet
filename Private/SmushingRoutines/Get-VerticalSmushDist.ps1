function Get-VerticalSmushDist
{
    param
    (
        [string[]]  $lines1,
        [string[]]  $lines2,
        [HashTable] $opts
    )

    $maxDist = $lines1.Length
    $len1    = $lines1.Length
    $len2    = $lines2.Length
    $curDist = 1
    $result  = $false

    :while while ($curDist -le $maxDist)
    {
        # subLines1 = lines1.slice(Math.max(0,len1-curDist), len1);
        # subLines2 = lines2.slice(0, Math.min(maxDist, curDist));

        [string[]] $subLines1 = $lines1[[System.Math]::Max(0, $len1 - $curDist)..$($len1 - 1)]
        [string[]] $subLines2 = $lines2[0..$([System.Math]::Min($maxDist, $curDist) - 1)]

        $slen = $subLines2.Length

        $result = ''
        for ($i = 0; $i -lt $slen; $i++)
        {
            $ret = Test-CanVerticalSmush $subLines1[$i] $subLines2[$i] $opts

            $result = switch ($ret)
            {
                'end'     {$ret}
                'invalid' {$ret; break}
                default   {if (-not $result) {'valid'} else {$result}}
            }
        }

        switch ($result)
        {
            'invalid' {$curDist--; break while}
            'end'     {break while}
            'valid'   {$curDist++}
        }
    }

    [System.Math]::Min($maxDist, $curDist)
}
