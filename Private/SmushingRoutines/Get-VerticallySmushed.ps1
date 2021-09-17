function Get-VerticallySmushed
{
    param
    (
        [string[]]  $lines1,
        [string[]]  $lines2,
        [int]       $overlap,
        [HashTable] $opts
    )

    $len1     = $lines1.Length
    $len2     = $lines2.Length
    $piece1   = $lines1[0..$([System.Math]::Max(0, $len1 - $overlap) - 1)]
    $piece2_1 = $lines1[[System.Math]::Max(0, $len1 - $overlap)..$($len1 - 1)]
    $piece2_2 = $lines2[0..$([System.Math]::Min($overlap, $len2) - 1)]
    $piece2   = @()

    $len = $piece2_1.Length
    for ($i = 0; $i -lt $len; $i++)
    {
        $line = if ($i -ge $len2)
        {
            $piece2_1[$i]
        }
        else
        {
            Get-VerticallySmushedLines $piece2_1[$i] $piece2_2[$i] $opts
        }

        $piece2 += $line
    }

    $piece3 = $lines2[[System.Math]::Min($overlap, $len2)..$($len2 - 1)]

    $piece1 + $piece2 + $piece3
}
