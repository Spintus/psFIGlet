function Get-VerticallySmushedFigLines
{
    param
    (
        $output,
        $lines,
        $opts
    )

    $len1 = $output[0].Length
    $len2 = $lines[0].Length

    if ($len1 -gt $len2)
    {
        $lines = Get-PaddedLines $lines ($len1 - $len2)
    }
    elseif ($len2 -gt $len1)
    {
        $output = Get-PaddedLines $output ($len2 - $len1)
    }

    $overlap = Get-VerticalSmushDist $output $lines $opts

    Get-VerticallySmushed $output $lines $overlap $opts
}
