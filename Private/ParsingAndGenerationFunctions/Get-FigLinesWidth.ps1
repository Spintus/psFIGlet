function Get-FigLinesWidth
{
    param
    (
        [string[]] $textLines
    )

    $textLinesMap = foreach ($line in $textLines)
    {
        $line.Length
    }

    ($textLinesmap | Measure-Object -Maximum).count
}
